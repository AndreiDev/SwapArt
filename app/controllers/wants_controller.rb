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

    @want = Want.find_or_initialize_by(user_id: @want_params['user_id'], item_id: @want_params['item_id'])
    if @want.persisted?
      @want.destroy!
    else
      @want.save!
    end

    @item = Item.find @want_params['item_id']

    @state = get_states([@item])[@item.id]

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
