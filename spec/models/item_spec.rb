require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image、neme、introduction、category_id、item_condition_id、postage_payer_id、prefecture_id、preparation_day_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'introductionが空だと出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'category_idが---だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_condition_idが---だと出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'postage_payer_idが---だと出品できない' do
        @item.postage_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it 'prefecture_idが---だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'preparation_day_idが---だと出品できない' do
        @item.preparation_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300~¥9,999,999の間以外だと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceは半角数字以外だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'userが紐づいてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
