# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plans, dependent: :destroy # 投稿機能
  has_many :likes, dependent: :destroy # いいね機能
  has_many :liked_plans, through: :likes, source: :plan
  attachment :image
  has_many :comments # コメント機能

  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  def already_liked?(plan)
    likes.exists?(plan_id: plan.id)
  end

  def active_for_authentication?
    super && (is_withdrawal == false)
  end
end
