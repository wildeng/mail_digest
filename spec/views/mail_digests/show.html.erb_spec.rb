require 'rails_helper'

RSpec.describe "mail_digests/show", type: :view do
  before(:each) do
    @mail_digest = assign(:mail_digest, MailDigest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
