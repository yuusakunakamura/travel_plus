class Plan < ApplicationRecord
	   mount_uploader :picture, PictureUploader
	    belongs_to :user
	    attachment :image
end
