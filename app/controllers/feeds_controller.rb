class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = Feed.where(mail_digest_id: params[:mail_digest_id])
  end

  # TODO: up to now the only available feed is RssFeed
  def new
    render partial: 'form', layout: false, locals: { form: params[:form] }
  end

  def create
    feed = Feed.new(feed_params)
    if feed&.save
      redirect_to :feeds, notice: 'URL Saved'
    else
      render :new
    end
  end

  def feed_params
    params.require(:feed).permit(:url, :title)
  end
end
