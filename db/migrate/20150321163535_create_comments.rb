class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :image
  end
end
