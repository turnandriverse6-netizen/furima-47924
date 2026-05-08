class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :shipping_day_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end
end
