class GalleryController < ApplicationController
  def index
    users_that_want_my_items = User.find_by_sql ["SELECT DISTINCT users.*
    FROM users
    LEFT JOIN wants on users.id = wants.user_id
    LEFT JOIN items on wants.item_id = items.id
    WHERE users.is_active = 1 AND users.is_blocked = 0
    AND items.user_id = '?'", current_user.id]

    @items_want_mine = Item.where.not(:user => current_user)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .where.not(id: current_user.block_items.pluck(:id))
    .where(user_id: users_that_want_my_items)

    @items_dont_want_mine= Item.where.not(:user => current_user)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .where.not(id: current_user.block_items.pluck(:id))
    .where.not(user_id: users_that_want_my_items)
  end
end
