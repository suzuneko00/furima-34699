require 'rails_helper'

def basic_auth(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '商品出品機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
  end

  context '商品を出品できるとき' do
    it '正しい情報を入力すれば商品を出品できる' do
      # トップページに移動する
      basic_auth root_path
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      select '1965', from: 'user[birthday(1i)]'
      select '11', from: 'user[birthday(2i)]'
      select '23', from: 'user[birthday(3i)]'
      find('input[name="commit"]').click
      # 商品出品ページに移動する
      vist user_items_path
      # 商品情報を入力する
      fill_in 'name', with: @item.name
      fill_in 'comment', with: @item.comment
      fill_in 'price', with: @item.price
      fill_in 'category_id', with: @item.category_id
      fill_in 'condition_id', with: @item.condition_id
      fill_in 'delivery_charge_id', with: @item.delivery_charge_id
      fill_in 'area_id', with: @item.area_id
      fill_in 'delivery_date_id', with: @item.delivery_date_id
      fill_in 'image', with: @item.image
      # 出品ボタンを押す
      click_on '出品する'
      # トップページに移動する
      root_path
    end
  end
end
