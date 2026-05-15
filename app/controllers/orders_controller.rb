class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:new, :create]

  def index
    @orders = Order.includes(:item).where(user_id: current_user.id)
  end

  def create
  end
end
