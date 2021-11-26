class ProductsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
 
  def index
    @products=Product.all.order("created_at DESC")
  end

  def new
    @product=Product.new
  end
  

  def create
     @product=Product.create(product_params)
     if @product.save
     redirect_to root_path
       
     else
       render:new
     end
  end
  private

  def product_params
    params.require(:product).permit(:image,:product_name,:category_id,:product_explanation,:product_status_id,:product_price,:delivery_information_id,:prefectures_id,:delivery_time_id).merge(user_id: current_user.id)
  end
end
