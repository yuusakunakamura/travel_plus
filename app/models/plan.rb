class Plan < ApplicationRecord
	  
	    belongs_to :user
	   
	    
	    has_many :likes #いいね機能
	    has_many :liked_users, through: :likes, source: :user
	    has_many :comments
	    has_many :plan_dates


	    mount_uploader :picture, PictureUploader

	  
	 
end
