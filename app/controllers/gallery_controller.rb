class GalleryController < ApplicationController
  def index

    @items = Item.joins(:user).where.not(:user => current_user)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .order('items.created_at DESC')
    .where.not(id: current_user.block_items)

    if params[:type].present?
      @items = @items.where(:type => params[:type].split(','))
    end

    if params[:age].present?
      @items = @items.where(:age => params[:age].split(','))
    end

    if params[:state].present?
      @items = @items.where(:state => params[:state].split(','))
    end

    if params[:price].present?
      @items = @items.where(:price => params[:price].split(','))
    end

    if params[:region].present?
      @items = @items.where(:users => {:region_id => params[:region].split(',')})
    end

    if params[:time].present?
      case params[:time]
        when '1'
          @items = @items.where(
              'items.created_at >= :one_days_ago',
              :one_days_ago  => Time.now - 1.days,
          )
        when '2'
          @items = @items.where(
              'items.created_at >= :week_days_ago',
              :week_days_ago  => Time.now - 7.days,
          )
        when '3'
          @items = @items.where(
              'items.created_at >= :month_ago',
              :month_ago  => Time.now - 1.months,
          )
      end
    end

    @number_of_pages = (@items.count-1)/AppConfig.max_items_per_page.to_i + 1

    if params[:page].nil? || params[:page].to_i <= 0
      @page_number = 1
    elsif params[:page].to_i >= @number_of_pages
      @page_number = @number_of_pages
    else
      @page_number = params[:page].to_i
    end

    @items = @items[(@page_number-1)*AppConfig.max_items_per_page.to_i, @page_number*AppConfig.max_items_per_page.to_i]

    @states = get_states(@items)

    @items.sort_by { |item| @states[item.id] }.reverse!

  end
end
