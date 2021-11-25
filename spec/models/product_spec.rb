require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品登録' do
    context '商品が登録できる場合' do
      it '全ての項目が入力出来ていれば保存できる' do
        expect(@product).to be_valid
      end
    end
    context '商品が登録できない場合' do
      it 'imageが空では保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では保存できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_explanationが空では保存できない' do
        @product.product_explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product explanation can't be blank")
      end
      it 'category_idが未選択では保存できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_status_idが未選択では保存できない' do
        @product.product_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status can't be blank")
      end
      it 'delivery_information_idが未選択では保存できない' do
        @product.delivery_information_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery information can't be blank")
      end
      it 'prefectures_idが未選択では保存できない' do
        @product.prefectures_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'delivery_time_idが未選択では保存できない' do
        @product.delivery_time_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'product_priceが空では保存できない' do
        @product.product_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price can't be blank")
      end
      it 'product_priceは299円以下では登録出来ない' do
        @product.product_price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price は300円以上9999999円以下かつ、半角数字で入力してください")
      end
      it 'product_priceは10000000円以上では登録出来ない' do
        @product.product_price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price は300円以上9999999円以下かつ、半角数字で入力してください")
      end
      it 'product_priceは全角数字では登録出来ない' do
        @product.product_price = '４５'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price は300円以上9999999円以下かつ、半角数字で入力してください")
      end
      it 'userが紐付いてなければ出品出来ない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
