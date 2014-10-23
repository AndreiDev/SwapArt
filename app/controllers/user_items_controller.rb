class UserItemsController < ApplicationController

  before_filter :set_current_user

  def show
    load_user_items
    # authorize! :index, @user_items.first
    respond_to do |format|
      format.js
    end
  end

  private

  def load_user_items
    @user_items ||= user_item_scope
    .where(:user_id => user_item_params[:user_id])
    .where(:is_blocked => false)
    .where(:is_active => true)
    .where.not(id: User.find(current_user.id).block_items.pluck(:id))
  end

  def user_item_params
    user_item_params = params
    user_item_params ? user_item_params.permit(:user_id) : {}
  end

  def user_item_scope
    Item.all
  end
end
