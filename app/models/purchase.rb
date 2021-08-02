class Purchase < ApplicationRecord
  belongs_to :user
  belong_to :item
  has_one :delivery
end
