FactoryBot.define do
  factory :product do                  
   product_name{"りんご"}                             
   category_id {2}         
   product_explanation{"いいものです"}    
   product_status_id {2}      
   product_price {"300"}         
   delivery_information_id {2}
   prefectures_id  {2}        
   delivery_time_id{2}
   user_id{1}
   association :user 
   after(:build) do |product|
    product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end
