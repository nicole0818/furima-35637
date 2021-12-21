require 'rails_helper'

RSpec.describe PurchaseRecordPlace, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      @purchase_record_place = FactoryBot.build(:purchase_record_place, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_place).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_record_place.building_name = ''
        expect(@purchase_record_place).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_record_place.postal_code = ''
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_place.postal_code = '1234567'
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record_place.prefectures_id = 1
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_record_place.city = ''
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_record_place.address = ''
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_record_place.telephone_number = ''
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは12桁以上の数値だと保存できないこと' do
        @purchase_record_place.telephone_number = '123456789012'
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'telephone_numberは英数混合では保存できないこと' do
        @purchase_record_place.telephone_number = '1a3b5c7d9e1f'
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Telephone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @purchase_record_place.token = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できないこと" do
        @purchase_record_place.user_id = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("User can't be blank")
      end

      it "product_idが空では登録できないこと" do
        @purchase_record_place.product_id = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Product can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_place.user_id = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐付いていないと保存できないこと' do
        @purchase_record_place.product_id = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Product can't be blank")
      end

    end
  end
end
