class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @purchase_record_place = PurchaseRecordPlace.new
    @product = Product.find(params[:product_id])
    if current_user.id == @product.user.id
      redirect_to root_path
     end
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_record_place = PurchaseRecordPlace.new(purchase_record_params)

    if @purchase_record_place.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @product.product_price,  # 商品の値段
        card: purchase_record_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_record_place.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_place).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: @product.id,token: params[:token])

  end
end
