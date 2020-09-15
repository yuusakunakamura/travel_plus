require 'rails_helper'
describe PlanDate do
   describe '#create' do
     it '投稿できる' do
      user = FactoryBot.create(:user)
      user.plan = FactoryBot.create(:plan)
      plan_date = build(:plan_date, user_id: user.id, plan_id: user.plan.id)
      plan_date.valid?
      expect(plan_date).to be_valid
    end
   end
end