class Feed < ApplicationRecord
  belongs_to :mail_digest

  has_many :feed_articles, dependent: :destroy
end
