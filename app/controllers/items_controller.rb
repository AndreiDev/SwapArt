class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /items
  # GET /items.json
  def index
    @items = current_user.items.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    item_params[:user_id] ||= current_user.id
    @item = Item.new(item_params)
    @item['user_id'] = current_user.id if item_params['user_id'].blank?

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: t('simple_form.labels.item.item_create') }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: t('model.item_update') }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: t('model.item_destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :type_id, :description, :image, :original_price, :height, :width, :age_id, :state_id, :is_active, :is_blocked)
    end
end
