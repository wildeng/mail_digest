# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mail_digests/new', type: :view do
  before(:each) do
    assign(:mail_digest, MailDigest.new)
  end

  it 'renders new mail_digest form' do
    render

    assert_select 'form[action=?][method=?]', mail_digests_path, 'post' do
    end
  end
end
