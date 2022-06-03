class MailDigest < ApplicationRecord
  belongs_to :user
  has_many :feeds
  
  validates :title, presence: true
  validates :user, presence: true
  accepts_nested_attributes_for :feeds, reject_if: lambda { |attributes| attributes['url'].blank? },
    allow_destroy: true

  def self.search(search)
    where('title ilike :pat or description ilike :pat', :pat => "%#{search}%")
  end
end
