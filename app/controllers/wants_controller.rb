class WantsController < ApplicationController
  before_action :set_want, only: [:show, :edit, :update, :destroy]
  before_action :want_params, only: [:toggle]

  load_and_authorize_resource

  # GET /wants
  # GET /wants.json
  def index
    @wants = Want.all
  end

  # GET /wants/1
  # GET /wants/1.json
  def show
  end

  # GET /wants/new
  def new
    @want = Want.new
  end

  # GET /wants/1/edit
  def edit
  end

  # POST /wants
  # POST /wants.json
  def create
    @want = Want.new(want_params)

    respond_to do |format|
      if @want.save
        format.html { redirect_to @want, notice: 'Want was successfully created.' }
        format.json { render :show, status: :created, location: @want }
      else
        format.html { render :new }
        format.json { render json: @want.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wants/1
  # PATCH/PUT /wants/1.json
  def update
    respond_to do |format|
      if @want.update(want_params)
        format.html { redirect_to @want, notice: 'Want was successfully updated.' }
        format.json { render :show, status: :ok, location: @want }
      else
        format.html { render :edit }
        format.json { render json: @want.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wants/1
  # DELETE /wants/1.json
  def destroy
    @want.destroy
    respond_to do |format|
      format.html { redirect_to wants_url, notice: 'Want was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle
    @item = Item.find @want_params['item_id']
    user_wants_item = @item.want_users.include? current_user
    users_that_want_my_items = User.find_by_sql ["SELECT DISTINCT users.*
    FROM users
    LEFT JOIN wants on users.id = wants.user_id
    LEFT JOIN items on wants.item_id = items.id
    WHERE users.is_active = 1 AND users.is_blocked = 0
    AND items.user_id = '?'", current_user.id]
    item_owner_wants_users_item = users_that_want_my_items.include? @item.user
    case [user_wants_item, item_owner_wants_users_item]
      when [false, false] # state_1
        @want = Want.create(user_id: @want_params['user_id'], item_id: @want_params['item_id'])
        @state = 2
      when [true, false] # state_2
        @want = Want.where(user_id: @want_params['user_id'], item_id: @want_params['item_id']).delete_all
        @item_id = @want_params['item_id']
        @state = 1
      when [false, true] # state_3
        @want = Want.create(user_id: @want_params['user_id'], item_id: @want_params['item_id'])
        @state = 4
      when [true, true] # state_4
        @want = Want.where(user_id: @want_params['user_id'], item_id: @want_params['item_id']).delete_all
        @item_id = @want_params['item_id']
        @state = 3
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_want
      @want = Want.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def want_params
      @want_params = params.require(:want).permit(:user_id, :item_id, :extra_mile)
      @want_params['user_id'] ||= current_user.id
    end
end
