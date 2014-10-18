class TypesController < ApplicationController

  load_and_authorize_resource

  def index
    load_types
  end

  def show
    load_type
  end

  def new
    build_type
  end

  def create
    build_type
    save_type or render 'new'
  end

  def edit
    load_type
    build_type
  end

  def update
    load_type
    build_type
    save_type or render 'edit'
  end

  def destroy
    load_type
    @type.destroy
    redirect_to types_path
  end

  private

  def load_types
    @types ||= type_scope.to_a
  end

  def load_type
    @type ||= type_scope.find(params[:id])
  end

  def build_type
    @type ||= type_scope.build
    @type.attributes = type_params
  end

  def save_type
    if @type.save
      redirect_to @type
    end
  end

  def type_params
    type_params = params[:type]
    type_params ? type_params.permit(:description) : {}
  end

  def type_scope
    Type.all
  end
end
