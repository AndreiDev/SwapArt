class GalleryController < ApplicationController
  def index

    users_that_want_my_items = User.find_by_sql ["SELECT DISTINCT users.*
    FROM users
    LEFT JOIN wants on users.id = wants.user_id
    LEFT JOIN items on wants.item_id = items.id
    WHERE users.is_active = 1 AND users.is_blocked = 0
    AND items.user_id = '?'", current_user.id]

    @items = Item.where.not(:user => current_user)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .where.not(id: current_user.block_items.pluck(:id))

    @states = {}
    @items.each { |item|
      user_wants_item = item.want_users.include? current_user
      item_owner_wants_users_item = users_that_want_my_items.include? item.user
      case [user_wants_item, item_owner_wants_users_item]
        when [false, false]
          @states[item.id] = 1
        when [true, false]
          @states[item.id] = 2
        when [false, true]
          @states[item.id] = 3
        when [true, true]
          @states[item.id] = 4
      end
    }

    @items.sort_by { |item| @states[item.id] }.reverse!

  end
end
