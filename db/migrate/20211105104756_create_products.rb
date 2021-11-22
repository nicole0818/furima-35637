class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name,  null: false    
      t.references :user ,   foreign_key: true, null: false
      t.integer :category_id , null: false    
      t.text :product_explanation , null: false    
      t.integer :product_status_id ,    null: false  
      t.integer :product_price   ,    null: false    
      t.integer :delivery_information_id ,null: false   
      t.integer :prefectures_id    , null: false    
      t.integer :delivery_time_id   , null: false    
      
      t.timestamps
    end
  end
end
