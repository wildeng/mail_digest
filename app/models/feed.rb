class Feed < ApplicationRecord
  belongs_to :mail_digest
  validates :url, presence: true
  has_many :feed_articles, dependent: :destroy
end
