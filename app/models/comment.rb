class Comment < ActiveRecord::Base

    belongs_to :images
    belongs_to :user
end
