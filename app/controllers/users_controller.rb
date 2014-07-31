class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  respond_to :html #, :json

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  def new
    #@user = User.new
    #respond_with(@user)
  end

  def edit
    #@user = User.find(params[:id])
  end

  def create
    authorize! :create, @user, :message => 'Not authorized as an administrator.'

    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'User was successfully created.'
    end
    after_save(nil, @user)
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'

    if @user.update_attributes(user_params)
      flash[:notice] = 'User was successfully updated.'
    end
    after_save(nil, @user)
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'

    @user.destroy

    flash[:notice] = 'User was successfully destroyed.'
    respond_with(@user)
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    authorize! :update, @user, :message => 'Not authorized as an administrator.'

    if request.patch? && params[:user][:phone] #&& params[:user][:email]
      if @user.update(phone: params[:user][:phone])
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :image, :phone, :role_ids => [])
  end

end
