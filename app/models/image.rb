class Image < ActiveRecord::Base

  has_attached_file :url, 
                  :styles => { :medium => "200x200"},
                  :default_url => "",
                  :convert_options => {:medium => '-background white -gravity center -extent 200x200'}

  # has_attached_file :url, :styles => {:thumb => "100x100>" }, 
  # :convert_options => {:thumb => "-gravity center -extent 100x100"}
  # validates_attachment_content_type :url, :content_type => /\Aimage\/.*\Z/

  has_many :comments
  belongs_to :user


end
