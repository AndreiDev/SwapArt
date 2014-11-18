require 'test_helper'

class UserItemTest < ActiveSupport::TestCase

  test "prepare_user_data_function_should_work" do
    User.current = users(:user_11)
    ui = UserItem.new(swappee_id: users(:user_21).id)
    assert ui.my_items_user_wants.present?
    assert ui.states.present?
  end

end
