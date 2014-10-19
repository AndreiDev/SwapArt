class TaggingsController < ApplicationController

  load_and_authorize_resource

  def index
    load_taggings
  end

  def show
    load_tagging
  end

  def new
    build_tagging
  end

  def create
    build_tagging
    save_tagging or render 'new'
  end

  def edit
    load_tagging
    build_tagging
  end

  def update
    load_tagging
    build_tagging
    save_tagging or render 'edit'
  end

  def destroy
    load_tagging
    @tagging.destroy
    redirect_to taggings_path
  end

  private

  def load_taggings
    @taggings ||= tagging_scope.to_a
  end

  def load_tagging
    @tagging ||= tagging_scope.find(params[:id])
  end

  def build_tagging
    @tagging ||= tagging_scope.build
    @tagging.attributes = tagging_params
  end

  def save_tagging
    if @tagging.save
      redirect_to @tagging
    end
  end

  def tagging_params
    tagging_params = params[:tagging]
    tagging_params ? tagging_params.permit(:item_id, tag_id) : {}
  end

  def tagging_scope
    Tagging.all
  end
end
