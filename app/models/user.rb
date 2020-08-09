class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plans,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_plans, through: :likes, source: :plan
  attachment :image
  has_many :comments
 def already_liked?(plan)
    self.likes.exists?(plan_id: plan.id)
  end
 
  def active_for_authentication?
    super && (self.is_withdrawal == false)
  end
   
end
