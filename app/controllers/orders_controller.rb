class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_root

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :district, :address_code, :building, :telephone).merge(item_id: params[:item_id]).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user_id or @item.order.present?
  end
end
