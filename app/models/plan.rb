# frozen_string_literal: true

class Plan < ApplicationRecord 
  belongs_to :user 

  has_many :likes # いいね機能
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
  has_many :plan_dates, dependent: :destroy
  attachment :image

  accepts_nested_attributes_for :plan_dates, allow_destroy: true # 追加form

  mount_uploader :picture, PictureUploader

  validates :title, presence: true, length: { maximum: 10 }
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :date, presence: true

  enum word:{
     "県を選択して下さい":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
     沖縄県:47
   }

   enum oversea:{
     "州を選択して下さい":0,
     アジア州:1,北アメリカ州:2,南アメリカ州:3,ヨーロッパ州:4,アフリカ州:5,オセアニア州:6
     
   } 

end
