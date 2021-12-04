 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/mail_digests", type: :request do
  
  # MailDigest. As you add validations to MailDigest, be sure to
  # adjust the attributes here as well.
  let(:user) { create(:user) }

  let(:valid_attributes) {
    {
      title: 'test digest',
      description: 'dummy test',
      update_frequency: 1,
      user: user
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  before(:each) do
    user.confirm
    login_user user 
  end

  describe "GET /index" do
    it "renders a successful response" do
      MailDigest.create! valid_attributes
      get mail_digests_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      mail_digest = MailDigest.create! valid_attributes
      get mail_digest_url(mail_digest)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_mail_digest_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      mail_digest = MailDigest.create! valid_attributes
      get edit_mail_digest_url(mail_digest)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MailDigest" do
        expect {
          post mail_digests_url, params: { mail_digest: valid_attributes }
        }.to change(MailDigest, :count).by(1)
      end

      it "redirects to the created mail_digest" do
        post mail_digests_url, params: { mail_digest: valid_attributes }
        expect(response).to redirect_to(mail_digest_url(MailDigest.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MailDigest" do
        expect {
          post mail_digests_url, params: { mail_digest: invalid_attributes }
        }.to change(MailDigest, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post mail_digests_url, params: { mail_digest: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested mail_digest" do
        mail_digest = MailDigest.create! valid_attributes
        patch mail_digest_url(mail_digest), params: { mail_digest: new_attributes }
        mail_digest.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the mail_digest" do
        mail_digest = MailDigest.create! valid_attributes
        patch mail_digest_url(mail_digest), params: { mail_digest: new_attributes }
        mail_digest.reload
        expect(response).to redirect_to(mail_digest_url(mail_digest))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        mail_digest = MailDigest.create! valid_attributes
        patch mail_digest_url(mail_digest), params: { mail_digest: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested mail_digest" do
      mail_digest = MailDigest.create! valid_attributes
      expect {
        delete mail_digest_url(mail_digest)
      }.to change(MailDigest, :count).by(-1)
    end

    it "redirects to the mail_digests list" do
      mail_digest = MailDigest.create! valid_attributes
      delete mail_digest_url(mail_digest)
      expect(response).to redirect_to(mail_digests_url)
    end
  end
end
