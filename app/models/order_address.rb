class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id,:postal_code, :prefecture_id, :district, :address_code, :building, :telephone, :token

  with_options presence: true do
    validates :item_id,:user_id, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :district, :address_code
    validates :telephone, format: {with: /\A[0-9]{1,11}\z/, message: "is invalid. Input only number"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, district: district, address_code: address_code, building: building, telephone: telephone, order_id: order.id)
  end
end