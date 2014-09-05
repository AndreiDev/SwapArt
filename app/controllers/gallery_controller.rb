class GalleryController < ApplicationController
  def index

    @items = Item.where.not(:user => current_user)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .where.not(id: current_user.block_items.pluck(:id))

    @states = get_states(@items)

    @items.sort_by { |item| @states[item.id] }.reverse!

  end
end
