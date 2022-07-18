# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mail_digests/index', type: :view do
  before(:each) do
    assign(:mail_digests, [
             MailDigest.create!,
             MailDigest.create!
           ])
  end

  it 'renders a list of mail_digests' do
    render
  end
end
