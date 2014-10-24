class UserItemsController < ApplicationController

  before_filter :set_current_user

  def show
    load_user_items
    respond_to do |format|
      format.js
    end
  end

  private

  def load_user_items
    @user_items ||= user_item_scope
  end

  def user_item_params
    user_item_params = params
    user_item_params ? user_item_params.permit(:swappee_id) : {}
  end

  def user_item_scope
    UserItem.new(user_item_params)
  end
end
