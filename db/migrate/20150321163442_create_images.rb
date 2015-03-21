class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :url
      t.integer :vote
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
