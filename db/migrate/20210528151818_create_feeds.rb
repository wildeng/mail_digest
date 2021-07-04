class CreateFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.string :url
      t.text :description
      t.integer :mail_digest_id
      t.timestamps
    end
  end
end
