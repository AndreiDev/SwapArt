class UserItemsController < ApplicationController

  def index
    authorize! :index, @user_item.first
    load_user_items
  end

  private

  def load_user_items
    @user_item ||= user_item_scope.where(:user_id => user_item_params[:user_id])
  end


  def user_item_params
    user_item_params = params
    user_item_params ? user_item_params.permit(:user_id) : {}
  end

  def user_item_scope
    Item.all
  end

end
