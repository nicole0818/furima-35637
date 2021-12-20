class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :postal_code,          null:false     
      t.integer :prefectures_id,      null:false     
      t.string :city,                  null:false     
      t.string :address,            null:false     
      t.string :building_name  
      t.string :telephone_number,   null:false     
      t.references :purchase_record,   foreign_key:true,null:false  
      t.timestamps
    end
  end
end
