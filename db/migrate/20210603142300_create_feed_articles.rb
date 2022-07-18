# frozen_string_literal: true

class CreateFeedArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :feed_articles do |t|
      t.string :title
      t.binary :description
      t.datetime :pub_date
      t.string :link
      t.integer :feed_id
      t.string :hash_check
      t.timestamps
    end
  end
end
