class MailDigest < ApplicationRecord
  belongs_to :user
  has_many :feeds

  accepts_nested_attributes_for :feeds, reject_if: :all_blank, allow_destroy: true
end
