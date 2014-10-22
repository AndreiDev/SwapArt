class TagsController < ApplicationController

  load_and_authorize_resource

  def index
    load_tags
  end

  def show
    load_tag
  end

  def new
    build_tag
  end

  def create
    build_tag
    save_tag or render 'new'
  end

  def edit
    load_tag
    build_tag
  end

  def update
    load_tag
    build_tag
    save_tag or render 'edit'
  end

  def destroy
    load_tag
    @tag.destroy
    redirect_to tags_path
  end

  private

  def load_tags
    @tags ||= tag_scope.to_a
  end

  def load_tag
    @tag ||= tag_scope.find(params[:id])
  end

  def build_tag
    @tag ||= tag_scope.build
    @tag.attributes = tag_params
  end

  def save_tag
    if @tag.save
      redirect_to @tag
    end
  end

  def tag_params
    tag_params = params[:tag]
    tag_params ? tag_params.permit(:description) : {}
  end

  def tag_scope
    Tag.all
  end
end
