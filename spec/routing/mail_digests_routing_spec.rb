require "rails_helper"

RSpec.describe MailDigestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mail_digests").to route_to("mail_digests#index")
    end

    it "routes to #new" do
      expect(get: "/mail_digests/new").to route_to("mail_digests#new")
    end

    it "routes to #show" do
      expect(get: "/mail_digests/1").to route_to("mail_digests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mail_digests/1/edit").to route_to("mail_digests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mail_digests").to route_to("mail_digests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mail_digests/1").to route_to("mail_digests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mail_digests/1").to route_to("mail_digests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mail_digests/1").to route_to("mail_digests#destroy", id: "1")
    end
  end
end
