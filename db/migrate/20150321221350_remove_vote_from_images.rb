class RemoveVoteFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :vote, :integer
  end
end
