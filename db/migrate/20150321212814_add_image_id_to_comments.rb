class AddImageIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :image, index: true
    add_foreign_key :comments, :images
  end
end
