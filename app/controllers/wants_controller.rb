class WantsController < ApplicationController

  load_and_authorize_resource

  before_filter :set_current_user

  def index
    load_wants
  end

  def show
    load_want
  end

  def new
    build_want
  end

  def create
    build_want
    save_want or render 'new'
  end

  def edit
    load_want
    build_want
  end

  def update
    load_want
    build_want
    save_want or render 'edit'
  end

  def destroy
    load_want
    @want.destroy
    respond_to do |format|
      format.html { redirect_to wants_path }
      format.js
    end
  end

  private

  def load_wants
    @wants = @wants.to_a.becomes(Want::AsUser) if @wants && @wants.class.name == 'ActiveRecord::Relation'
    @wants ||= want_scope.to_a
  end

  def load_want
    @want = @want.becomes(Want::AsUser) if @want
    @want ||= want_scope.find(params[:id])
  end

  def build_want
    @want = @want.becomes(Want::AsUser) if @want
    @want ||= want_scope.build
    @want.attributes = want_params
  end

  def save_want
    if @want.save
      respond_to do |format|
        format.html { redirect_to @want }
        format.js
      end
    end
  end

  def want_params
    want_params = params[:want]
    want_params ? want_params.permit(:id, :item_id) : {}
  end

  def want_scope
    Want.all
  end
end
