class PurchaseRecordPlace
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :telephone_number,:user_id,:product_id,:token
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefectures_id,:city,:address,:telephone_number,presence: true
  validates :prefectures_id, numericality: { other_than: 1 ,message:"can't be blank"}
  validates :telephone_number, format: {with: /\A[0-9]{11}\z/ }
  validates :token,:user_id,:product_id, presence: true

  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)
    Place.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name,telephone_number: telephone_number,purchase_record_id: purchase_record.id)
  end
end