class PurchaseForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :phone_number, :building_name, :purchase
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :purchase
  end

  

end