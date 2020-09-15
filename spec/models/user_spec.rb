require 'rails_helper'
describe User do
  describe '#create' do
    it '登録できる' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
    it 'emailがないと登録できない' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it 'emailが重複してると登録できない' do
      user1 = FactoryBot.create(:user)
      user2 = build(:user, email: "aaa@aaa")
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end
    it 'nameがないと登録できない' do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it 'nameが重複してると登録できない' do
      user1 = FactoryBot.create(:user)
      user2 = build(:user, name: "eeeee")
      user2.valid?
      expect(user2.errors[:name]).to include("はすでに存在します")
    end
    it 'nameが10文字以上で登録できない' do
      user = build(:user, name: "1234567891011")
      user.valid?
      expect(user.errors[:name]).to include("は10文字以内で入力してください")
    end
    it 'passwordがなくて登録できない' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it 'password_confirmationがpasswordと一致しなくて登録できない' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
  end
end
