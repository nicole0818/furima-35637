require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    context'ユーザー登録が出来る場合'do
    it '全ての項目が入力出来ていれば登録できる' do
      expect(@user).to be_valid
    end
   end

    context'ユーザー登録が出来ない場合'do
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it "last_name_kanjiが空では登録できない" do
    @user.last_name_kanji = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
end

it "first_name_kanjiが空では登録できない" do
  @user.first_name_kanji = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kanji can't be blank")
end

it "last_name_kanjiとfirst_name_kanjiはカタカナでは登録できない" do
  @user.last_name_kanji = 'タナカ'
  @user.first_name_kanji = 'イチロウ'
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kanji に漢字を使用してください", "First name kanji に漢字を使用してください")
end


it "last_name_kanaが空では登録できない" do
  @user.last_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana can't be blank")
end

it "first_name_kanaが空では登録できない" do
  @user.first_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank")
end

it "last_name_kanaとfirst_name_kanaは漢字では登録できない" do
  @user.last_name_kana = '田中'
  @user.first_name_kana = '一朗'
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana にひらがなを使用してください", "First name kana にひらがなを使用してください")
end

it "birthdayが空では登録できない" do
  @user.birthday = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Birthday can't be blank")
end

   it "英字のみのpasswordでは登録できない" do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英字と数字の両方を含めて設定してください")
   end

   it "数字のみのpasswordでは登録できない" do
    @user.password = '1111111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password には半角英字と数字の両方を含めて設定してください")
end

it "全角文字のpasswordでは登録できない" do
  @user.password = 'Test0818'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password には半角英字と数字の両方を含めて設定してください")
end

      it "passwordとpassword_confirmationは同一の値でなくてはならない" do
        @user.password_confirmation = 'test0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "emailは@を入力しないと登録できない" do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordは6文字以上でないと登録できない" do
        @user.password = 'test0'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end

   it '重複したemailが存在する場合登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  end
 end
end