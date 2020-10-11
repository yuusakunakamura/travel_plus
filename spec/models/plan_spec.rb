require 'rails_helper'
describe Plan do
   describe '#create' do
     it '投稿ができる' do
      user = FactoryBot.create(:user)
      plan = build(:plan, user_id: user.id)
      plan.valid?
      expect(plan).to be_valid
    end
    it 'titleがないから投稿できない' do
      user = FactoryBot.create(:user)
      plan = build(:plan, user_id: user.id, title: "")
      plan.valid?
      expect(plan.errors[:title]).to include("を入力してください")
    end
     it 'titleが10文字以上で投稿できない' do
      user = FactoryBot.create(:user)
      plan = build(:plan, user_id: user.id, title: "1234567891011")
      plan.valid?
      expect(plan.errors[:title]).to include("は10文字以内で入力してください")
    end
    it 'introductionがないと投稿できない' do
      user = FactoryBot.create(:user)
      plan = build(:plan, user_id: user.id, introduction: "")
      plan.valid?
      expect(plan.errors[:introduction]).to include("を入力してください")
    end
    it 'dateがないと投稿できない' do
      user = FactoryBot.create(:user)
      plan = build(:plan, user_id: user.id,  date: "")
      plan.valid?
      expect(plan.errors[:date]).to include("を入力してください")
    end
   end
end
