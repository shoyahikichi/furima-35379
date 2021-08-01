class PurchaseForm
  include ActiveModel::Model

  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :address, :phone_number, :building_name, :purchase

  
end