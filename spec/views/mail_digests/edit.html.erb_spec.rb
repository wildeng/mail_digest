# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mail_digests/edit', type: :view do
  before(:each) do
    @mail_digest = assign(:mail_digest, MailDigest.create!)
  end

  it 'renders the edit mail_digest form' do
    render

    assert_select 'form[action=?][method=?]', mail_digest_path(@mail_digest), 'post' do
    end
  end
end
