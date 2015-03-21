class AddCategoriesToImage < ActiveRecord::Migration
  def change
    add_column :images, :categories, :string
  end
end
