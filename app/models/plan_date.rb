class PlanDate < ApplicationRecord
	belongs_to :plan
	attachment :image
end
