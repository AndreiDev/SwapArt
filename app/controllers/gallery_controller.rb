class GalleryController < ApplicationController

  before_filter :set_current_user

  def show
    load_gallery
  end

  private

  def load_gallery
    @gallery ||= gallery_scope
  end

  def gallery_params
    gallery_params = params
    gallery_params ? gallery_params.permit(:type, :age, :state, :region, :price, :time, :page) : {}
  end

  def gallery_scope
    Gallery.new(gallery_params)
  end

end
