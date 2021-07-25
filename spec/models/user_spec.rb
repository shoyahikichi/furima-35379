require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとfamily_name、first_name_kanaとfamily_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で半角英数字混合あれば登録できる' do
        @user.password = 'a111111'
        @user.password_confirmation = 'a111111'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '0000000'
        @user.password_confirmation = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'emailに@が含まれない場合は登録ができない' do
        @user.email = 'abcd.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'abcdefghi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordは全角だと登録できない' do
        @user.password = 'ａｂｃｄｅｆｇ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'first_nameは空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは英字のみでは登録できない' do
        @user.first_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'family_nameは空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameは英字のみでは登録できない' do
        @user.family_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters')
      end
      it 'first_name_kanaは空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaはひらがなでは登録できない' do
        @user.first_name_kana = 'あべ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kanaは英字のみでは登録できない' do
        @user.first_name_kana = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'family_name_kanaは空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'family_name_kanaはひらがなでは登録できない' do
        @user.family_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end
      it 'family_name_kanaは英字のみでは登録できない' do
        @user.family_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end
    end
  end
end
