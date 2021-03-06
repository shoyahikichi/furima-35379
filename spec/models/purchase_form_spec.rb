require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/output-image1.png')
    @item.save
    @purchase_form = FactoryBot.build(:purchase_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@purchase_form).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_form.building_name = ''
        expect(@purchase_form).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'userが紐づいていないと購入できないこと' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できないこと' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号の保存にはハイフンがないと購入できない' do
        @purchase_form.postal_code = '1112222'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号が空では購入できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が---だと購入できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空では購入できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号は11桁以内の数値でないと購入できない' do
        @purchase_form.phone_number = '0901111222233'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号が空では購入できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は英数字混合では購入できない' do
        @purchase_form.phone_number = '090asdf12e3'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが空では購入ができない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
