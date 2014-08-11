class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  respond_to :html #, :json

  # GET /users
  # GET /users.json
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@user = User.find(params[:id])
    #respond_with(@user)
  end

#  def new
    #@user = User.new
    #respond_with(@user)
#  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    authorize! :create, @user, :message => 'Not authorized as an administrator.'

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    after_save(nil, @user)
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    after_save(nil, @user)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'

    @user.destroy
    @user.identity.destroy if @user.identity.present?

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
    #respond_with(@user)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :region_id, :is_active, :is_blocked, :role_ids => [])
  end

end
