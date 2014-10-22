class ItemsController < ApplicationController

  load_and_authorize_resource

  before_filter :set_current_user
  before_action :set_s3_direct_post

  def index
    load_items
  end

  def show
    load_item
  end

  def new
    build_item
  end

  def create
    build_item
    save_item or render 'new'
  end

  def edit
    load_item
    build_item
  end

  def update
    load_item
    build_item
    respond_to do |format|
      format.html {
        save_item or render 'edit'
      }
      format.js {
        @item.save
      }
    end

  end

  def destroy
    load_item
    @item.destroy
    redirect_to items_path
  end

  private

  def load_items
    @items ||= item_scope.to_a
  end

  def load_item
    @item ||= item_scope.find(params[:id])
  end

  def build_item
    @item ||= item_scope.build
    @item.attributes = item_params
  end

  def save_item
    if @item.save
      redirect_to items_path
    end
  end

  def item_params
    item_params = params[:item]
    item_params ? item_params.permit(:user_id, :type_id, :description, :image_url, :price_id, :height, :width, :age_id, :state_id, :is_active, :is_blocked) : {}
  end

  def item_scope
    Item.all
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "#{SecureRandom.uuid}_${filename}", success_action_status: 201, acl: :public_read)
  end
end
