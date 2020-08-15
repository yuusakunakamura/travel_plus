class Plan < ApplicationRecord
	  
	    belongs_to :user
	   
	    
	    has_many :likes #いいね機能
	    has_many :liked_users, through: :likes, source: :user
	    has_many :comments
	    has_many :plan_dates, :dependent => :destroy
	    
        accepts_nested_attributes_for :plan_dates, allow_destroy: true # 追加form

	    mount_uploader :picture, PictureUploader

	    validates :title, presence: true 
        validates :introduction, presence: true 
        validates :date, presence: true 
	  
	 
end
