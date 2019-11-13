require 'rails_helper'
describe User do
  describe '全ての項目が埋まっている' do
    it "全てのバリデーションをクリア" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe 'nicknameが空' do
    it "ニックネームが空であることにバリデーションがかかる" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end

  describe 'emailが空' do
    it "メールアドレスが空であることにバリデーションがかかる" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  describe 'passwordが空' do
    it "passwordが空であることにバリデーションがかかる" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  describe 'password_confirmationが空' do
    it "password_confirmationが空であることにバリデーションがかかる" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  describe 'nicknameが13文字以上であれば登録できない' do
    it "nicknameが13文字以上であることにバリデーションがかかる" do
      user = build(:user, nickname: "1234567890123")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 12 characters)")
    end
  end

  describe 'nicknameが12文字以下であれば登録できる' do
    it "nicknameが12文字以上であることにバリデーションがかからない" do
      user = build(:user, nickname: "123456789012")
      expect(user).to be_valid
    end
  end

  describe 'nicknameが重複していると登録できない' do
    it "nicknameが重複するとバリデーションがかかる" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end
  end

  describe 'emailが重複していると登録できない' do
    it "emailが重複するとバリデーションがかかる" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  end

  describe 'passwordが６文字以上であれば登録できる' do
    it "passwordが６文字以上であればバリデーションがかからない" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end
  end

  describe 'passwordが5文字以下であれば登録できない' do
    it "passwordが5文字以下であればバリデーションがかかる" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end

  describe 'family_name_kanjiが空だと登録できない' do
    it "family_name_kanjiが空であることにバリデーションがかかる" do
      user = build(:user, family_name_kanji: "")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("can't be blank")
    end
  end

  describe 'family_name_kanjiが半角だと登録できない' do
    it "family_name_kanjiが半角であることにバリデーションがかかる" do
      user = build(:user, family_name_kanji: "yamada")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("全角のみで入力して下さい")
    end
  end

  describe 'family_name_kanjiが全角だと登録できる' do
    it "family_name_kanjiが全角だとバリデーションがかからない" do
      user = build(:user, family_name_kanji: "山田")
      user.valid?
      expect(user).to be_valid
    end
  end

  describe 'first_name_kanjiが空だと登録できない' do
    it "first_name_kanjiが空であることにバリデーションがかかる" do
      user = build(:user, first_name_kanji: "")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("can't be blank")
    end
  end

  describe 'first_name_kanjiが半角だと登録できない' do
    it "first_name_kanjiが半角であることにバリデーションがかかる" do
      user = build(:user, first_name_kanji: "yamada")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("全角のみで入力して下さい")
    end
  end

  describe 'first_name_kanjiが全角だと登録できる' do
    it "first_name_kanjiが全角だとバリデーションがかからない" do
      user = build(:user, first_name_kanji: "山田")
      user.valid?
      expect(user).to be_valid
    end
  end

  describe 'family_name_kanaが空だと登録できない' do
    it "family_name_kanaが空であることにバリデーションがかかる" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
  end

  describe 'family_name_kanaが半角だと登録できない' do
    it "family_name_kanaが半角であることにバリデーションがかかる" do
      user = build(:user, family_name_kana: "yamada")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
  end

  describe 'family_name_kanaが全角漢字だと登録できない' do
    it "family_name_kanaが全角漢字だとバリデーションがかかる" do
      user = build(:user, family_name_kana: "山田")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
  end

  describe 'family_name_kanaが全角ひらがなだと登録できない' do
    it "family_name_kanaが全角ひらがなだとバリデーションがかかる" do
      user = build(:user, family_name_kana: "やまだ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
  end

  describe 'family_name_kanaが全角カタカナだと登録できる' do
    it "family_name_kanaが全角カタカナだとバリデーションがかからない" do
      user = build(:user, family_name_kana: "ヤマダ")
      user.valid?
      expect(user).to be_valid
    end
  end

  describe 'first_name_kanaが空だと登録できない' do
    it "first_name_kanaが空であることにバリデーションがかかる" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
  end

  describe 'first_name_kanaが半角だと登録できない' do
    it "first_name_kanaが半角であることにバリデーションがかかる" do
      user = build(:user, first_name_kana: "yamada")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
  end

  describe 'first_name_kanaが全角漢字だと登録できない' do
    it "first_name_kanaが全角漢字だとバリデーションがかかる" do
      user = build(:user, first_name_kana: "山田")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
  end

  describe 'first_name_kanaが全角ひらがなだと登録できない' do
    it "first_name_kanaが全角ひらがなだとバリデーションがかかる" do
      user = build(:user, first_name_kana: "やまだ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
  end

  describe 'first_name_kanaが全角カタカナだと登録できる' do
    it "first_name_kanaが全角カタカナだとバリデーションがかからない" do
      user = build(:user, first_name_kana: "ヤマダ")
      user.valid?
      expect(user).to be_valid
    end
  end


  
end
