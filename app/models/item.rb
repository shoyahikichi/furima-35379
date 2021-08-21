class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :preparation_day
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                      inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
