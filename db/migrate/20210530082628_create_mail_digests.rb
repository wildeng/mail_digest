# frozen_string_literal: true

class CreateMailDigests < ActiveRecord::Migration[6.1]
  def change
    create_table :mail_digests do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :update_frequency
      t.timestamps
    end
  end
end
