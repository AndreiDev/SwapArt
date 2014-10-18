class RegionsController < ApplicationController

  load_and_authorize_resource

  def index
    load_regions
  end

  def show
    load_region
  end

  def new
    build_region
  end

  def create
    build_region
    save_region or render 'new'
  end

  def edit
    load_region
    build_region
  end

  def update
    load_region
    build_region
    save_region or render 'edit'
  end

  def destroy
    load_region
    @region.destroy
    redirect_to regions_path
  end

  private

  def load_regions
    @regions ||= region_scope.to_a
  end

  def load_region
    @region ||= region_scope.find(params[:id])
  end

  def build_region
    @aregion ||= region_scope.build
    @region.attributes = region_params
  end

  def save_region
    if @region.save
      redirect_to @region
    end
  end

  def region_params
    region_params = params[:region]
    region_params ? region_params.permit(:description) : {}
  end

  def region_scope
    Region.all
  end
end
