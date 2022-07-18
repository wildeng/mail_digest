# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feed, type: :model do
  context 'when a digest exists' do
    describe 'a feed is created' do
      let(:user) { create(:user) }
      before do
        user.confirm
      end
      it 'validates presence of the url' do
        digest = create(:mail_digest, user: user)
        feed = build(:feed, mail_digest: digest, url: nil)
        feed.validate
        expect(feed.errors[:url]).to include("can't be blank")
      end
    end
  end
end
