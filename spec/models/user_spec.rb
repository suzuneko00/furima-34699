require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー新規登録できるとき' do
      it '正しい情報を入力すると登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ新規登録できないとき(ユーザー情報)' do
      it 'ニックネームが必須であること' do
        @user = FactoryBot.build(:user, nickname: '')
        @user.valid?
      end
      it 'メールアドレスが必須であること' do
        @user = FactoryBot.build(:user, email: '')
        @user.valid?
      end
      it 'メールアドレスが一意性であること' do
        @user = User.create(email: 'taro@example.com')
        expect(@user).to_not be_valid
      end
      it 'メールアドレスには、＠を含む必要があること' do
        @user = FactoryBot.build(:user, email: 'sample.com')
        @user.valid?
      end
      it 'パスワードが必須であること' do
        @user = FactoryBot.build(:user, password: '')
        @user.valid?
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user = FactoryBot.build(:user, password: 's12')
        @user.valid?
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user = FactoryBot.build(:user, password: '123456')
        @user.valid?
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user = FactoryBot.build(:user, password_confirmation: '')
        @user.valid?
      end
      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user = FactoryBot.build(:user, password_confirmation: 'd123456')
        @user.valid?
      end
    end

    context 'ユーザー新規登録できないとき(本人確認情報)' do
      it 'ユーザー本名は、名字が必須であること' do
        @user = FactoryBot.build(:user, last_name: '')
        @user.valid?
      end
      it 'ユーザー本名は、名前が必須であること' do
        @user = FactoryBot.build(:user, first_name: '')
        @user.valid?
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user = FactoryBot.build(:user, first_name: 'yamada')
        @user.valid?
      end
      it 'ユーザー本名のフリガナは、名字が必須であること' do
        @user = FactoryBot.build(:user, last_name: '')
        @user.valid?
      end
      it 'ユーザー本名のフリガナは、名前が必須であること' do
        @user = FactoryBot.build(:user, first_name: '')
        @user.valid?
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user = FactoryBot.build(:user, first_name: '山田')
        @user.valid?
      end
      it '生年月日が必須であること' do
        @user = FactoryBot.build(:user, birthday: '')
        @user.valid?
      end
    end
  end
end
