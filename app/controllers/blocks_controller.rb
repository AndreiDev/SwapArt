class BlocksController < ApplicationController

  authorize_resource

  before_filter :set_current_user

  def index
    load_blocks
  end

  def show
    load_block
  end

  def new
    build_block
  end

  def create
    build_block
    save_block or render 'new'
  end

  def edit
    load_block
    build_block
  end

  def update
    load_block
    build_block
    save_block or render 'edit'
  end

  def destroy
    load_block
    @block.destroy
    redirect_to blocks_path
  end

  private

  def load_blocks
    @blocks ||= block_scope.to_a
  end

  def load_block
    @block ||= block_scope.find(params[:id])
  end

  def build_block
    @block ||= block_scope.build
    @block.attributes = block_params
  end

  def save_block
    if @block.save
      respond_to do |format|
        format.html { redirect_to @block }
        format.js
      end
    end
  end

  def block_params
    block_params = params[:block]
    block_params ? block_params.permit(:id, :item_id) : {}
  end

  def block_scope
    Block::AsUser.all
  end
end
