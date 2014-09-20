class GalleryController < ApplicationController
  def index

    @items = Item.where.not(:user => current_user)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .where.not(id: current_user.block_items.pluck(:id))

    if params[:type].present?
      @items = @items.where(:type => params[:type].split(','))
    end

    if params[:age].present?
      @items = @items.where(:age => params[:age].split(','))
    end

    if params[:price].present?
      @items = @items.where(:price => params[:price].split(','))
    end

    if params[:region].present?
      @items.joins(:user).where(:users => {:region_id => params[:region].split(',')}).pluck(:id)
    end

    @number_of_pages = (@items.count-1)/8 + 1

    if params[:page].nil? || params[:page].to_i <= 0
      @page_number = 1
    elsif params[:page].to_i >= @number_of_pages
      @page_number = @number_of_pages
    else
      @page_number = params[:page].to_i
    end

    if params[:page].present?
      @items = @items[(@page_number-1)*8, @page_number*8]
    end

    @states = get_states(@items)

    @items.sort_by { |item| @states[item.id] }.reverse!

  end
end
