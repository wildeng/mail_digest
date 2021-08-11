require 'rails_helper'

RSpec.describe MailDigest, type: :model do
  context 'when a user exists' do
    let(:user) { create(:user) }
    describe "and is logged in" do
      before do
        user.confirm      
      end

      it 'creates a mail digest' do
        digest = create(:mail_digest, user: user)
        expect(digest.id).to_not be(nil)
        expect(digest.user.id).to eq(user.id)
      end
      
      it 'validates the presence of the title' do
        digest = build(:mail_digest, user: user, title: nil)
        digest.validate
        expect(digest.errors[:title]).to include("can't be blank")
      end

      it 'validates the presence of user' do
        digest = build(:mail_digest, user: nil)
        digest.validate
        expect(digest.errors[:user]).to include("can't be blank")
      end
    end
  end
end
