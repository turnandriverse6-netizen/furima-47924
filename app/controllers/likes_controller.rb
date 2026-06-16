class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    item = Item.find(params[:item_id])
    return redirect_to item_path(item) if item.user_id == current_user.id
    current_user.likes.find_or_create_by(item_id: item.id)
    redirect_to item_path(item)
  end

  def destroy
    current_user.likes.find_by(item_id: params[:item_id])&.destroy
    redirect_to item_path(params[:item_id])
  end
end
