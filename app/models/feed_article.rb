# frozen_string_literal: true

class FeedArticle < ApplicationRecord
  belongs_to :feed

  validates_presence_of :title, :link, :feed_id, :hash_check
end
