class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   validates :nickname,presence: true     

   with_options presence: true, format: { with: /\A[あ-んァ-ヶ一-龥々ー]+\z/, message: 'に漢字を使用してください' } do
    validates :last_name_kanji
    validates :first_name_kanji
  end
  
   with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'にカタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
   
   validates :birthday,presence: true
   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と数字の両方を含めて設定してください'
end
