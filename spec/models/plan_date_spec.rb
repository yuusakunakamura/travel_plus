require 'rails_helper'
describe PlanDate do
   describe '#create' do
     it '投稿ができる' do
      user = FactoryBot.create(:user)
      plan = FactoryBot.create(:plan,user_id: user.id)
      plan_date = build(:plan_date, plan_id: plan.id)
      plan_date.valid?
      expect(plan_date).to be_valid
    end
     it 'place_nameがなくて投稿ができない' do
      user = FactoryBot.create(:user)
      plan = FactoryBot.create(:plan,user_id: user.id)
      plan_date = build(:plan_date, plan_id: plan.id,place_name: "")
      plan_date.valid?
      expect(plan_date.errors[:place_name]).to include("を入力してください")
    end
     it 'place_introductionがなくて投稿できない' do
      user = FactoryBot.create(:user)
      plan = FactoryBot.create(:plan,user_id: user.id)
      plan_date = build(:plan_date, plan_id: plan.id,place_introduction: "")
      plan_date.valid?
      expect(plan_date.errors[:place_introduction]).to include("を入力してください")
    end
     it 'timeがなくて投稿できない' do 
      user = FactoryBot.create(:user)
      plan = FactoryBot.create(:plan,user_id: user.id)
      plan_date = build(:plan_date, plan_id: plan.id,time: "")
      plan_date.valid?
      expect(plan_date.errors[:time]).to include("を入力してください")
    end
   end
end 