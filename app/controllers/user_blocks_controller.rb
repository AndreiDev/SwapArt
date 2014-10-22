class UserBlocksController < ApplicationController

  def destroy
    load_user_block
    authorize! :destroy, @user_block.first
    if @user_block.destroy_all
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def load_user_block
    @user_block ||= user_block_scope.where(:user_id => user_block_params[:user_id])
  end


  def user_block_params
    user_block_params = params
    user_block_params ? user_block_params.permit(:user_id) : {}
  end

  def user_block_scope
    Block.all
  end
end
