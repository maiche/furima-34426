require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  item = FactoryBot.create(:item)
  user = FactoryBot.create(:user)
  before do
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必要な情報を適切に入力すると商品購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも商品購入できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'クレジットカードのトークンが生成されないと商品購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では商品購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空では商品購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では商品購入できない' do
        @order_address.district = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("District can't be blank")
      end
      it '番地が空では商品購入できない' do
        @order_address.address_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address code can't be blank")
      end
      it '電話番号が空では商品購入できない' do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it '郵便番号にハイフンがなければ商品購入できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が英字では商品購入できない' do
        @order_address.postal_code = "abc-defg"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角文字では商品購入できない' do
        @order_address.postal_code = "１２３-４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '電話番号が英字では商品購入できない' do
        @order_address.telephone = "abcdefghijk"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
      it '電話番号が全角文字では商品購入できない' do
        @order_address.telephone = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
    end
  end
end
