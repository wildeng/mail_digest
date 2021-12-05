class MailDigestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mail_digest, only: %i[ show edit update destroy ]

  # GET /mail_digests or /mail_digests.json
  def index
    @mail_digests = current_user.mail_digests
  end

  # GET /mail_digests/1 or /mail_digests/1.json
  def show
    @mail_digest = current_user.mail_digests.find(params[:id])
  end

  # GET /mail_digests/new
  def new
    @mail_digest = current_user.mail_digests.new
  end

  # GET /mail_digests/1/edit
  def edit
  end

  # POST /mail_digests or /mail_digests.json
  def create
    @mail_digest = current_user.mail_digests.new(mail_digest_params)
    respond_to do |format|
      if @mail_digest.save
        # TODO add support for custome scheduling
        @mail_digest.feeds.each do |feed|
          UpdateFeedsWorker.perform_async(feed.id)   
        end
        MailDigestMailer.digest_update(current_user).deliver_later
        format.html { redirect_to @mail_digest, notice: "Mail digest was successfully created." }
        format.json { render :show, status: :created, location: @mail_digest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mail_digest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_digests/1 or /mail_digests/1.json
  def update
    respond_to do |format|
      if @mail_digest.update(mail_digest_params)
        @mail_digest.feeds.each do |feed|
          UpdateFeedsWorker.perform_async(feed.id)   
        end
        MailDigestMailer.digest_update(current_user).deliver_later
        format.html { redirect_to @mail_digest, notice: "Mail digest was successfully updated." }
        format.json { render :show, status: :ok, location: @mail_digest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mail_digest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_digests/1 or /mail_digests/1.json
  def destroy
    @mail_digest.destroy
    respond_to do |format|
      format.html { redirect_to mail_digests_url, notice: "Mail digest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_digest
      @mail_digest = MailDigest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mail_digest_params
      params.require(:mail_digest).permit(:title, :description, feeds_attributes: [:id, :url, :title, :_destroy])
    end
end
