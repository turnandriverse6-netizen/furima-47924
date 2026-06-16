class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.likes.create(item_id: params[:item_id])
    redirect_to item_path(params[:item_id])
  end

  def destroy
    current_user.likes.find_by(item_id: params[:item_id])&.destroy
    redirect_to item_path(params[:item_id])
  end
end
