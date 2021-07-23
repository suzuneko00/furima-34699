require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品ができるとき' do
      it '正しい情報を入力すると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が必須であること' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が必須であること' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域が必須であること' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数が必須であること' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it '販売価格が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '150'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
