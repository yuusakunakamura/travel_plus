class PlanDate < ApplicationRecord
	belongs_to :plan
	attachment :image

	 validates :place_name, presence: true
	 validates :place_name, presence: true
	 validates :place_introduction, presence: true
	 validates :time, presence: true
end
