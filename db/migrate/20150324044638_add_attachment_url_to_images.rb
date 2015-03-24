class AddAttachmentUrlToImages < ActiveRecord::Migration
  def change
    def self.up
      change_table :images do |t|
      t.attachment :url
      end
    end
  end 
  def self.down
    remove_attachment :images, :url
  end
end
