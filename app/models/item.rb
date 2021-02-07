class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    with_options length: { maximum: 40 } do
      validates :title
    end
    with_options length: { maximum: 1000 } do
      validates :description
    end
    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id
    end
    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} do
      validates :price
    end
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date
end
