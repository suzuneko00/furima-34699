require 'rails_helper'

def basic_auth(path)
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      basic_auth root_path
      # トップページに新規登録とログインボタンがあることを確認する
      expect(page).to have_content( '新規登録' )
      expect(page).to have_content( 'ログイン' )
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with:@user.password_confirmation
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      select '1965',from: 'user[birthday(1i)]'
      select '11',from: 'user[birthday(2i)]'
      select '23',from: 'user[birthday(3i)]'
      find('input[name="commit"]').click
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページにニックネームとログアウトボタンがあることを確認する
      expect(page).to have_content( @user.nickname )
      expect(page).to have_content( 'ログアウト' )
    end
  end
  context 'ユーザー新規登録できないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      basic_auth root_path
      # トップページに新規登録とログインボタンがあることを確認する
      expect(page).to have_content( '新規登録' )
      expect(page).to have_content( 'ログイン' )
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password-confirmation', with: ''
      fill_in 'last-name', with: ''
      fill_in 'first-name', with: ''
      fill_in 'last-name-kana', with: ''
      fill_in 'first-name-kana', with: ''
      select '1965',from: 'user[birthday(1i)]'
      select '11',from: 'user[birthday(2i)]'
      select '23',from: 'user[birthday(3i)]'
      find('input[name="commit"]').click
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

