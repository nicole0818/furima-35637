class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category,:product_status

   #空の投稿を保存できないようにする
   validates :image,:product_name,:product_explanation,:product_price, presence: true
   validates :product_price,numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 ,message:"は300円以上9999999円以下かつ、半角数字で入力してください"}
   with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :product_price
  end

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :category_id,:product_status_id ,:delivery_information_id ,:prefectures_id,:delivery_time_id, numericality: { other_than: 1, message: "can't be blank" } 
end
