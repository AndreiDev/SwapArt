require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should create new user" do
    user = User.new(email: 'ilana.averkin@gmail.com', first_name: 'אילנה', last_name: 'אברקין',
                      password: 'abcd1234', password_confirmation: 'abcd1234')
    user.skip_confirmation!
    user.save!
    user.add_role 'admin'
    assert user.persisted?
    assert_equal(user.get_user_roles_name,'admin')
  end

  test "get_states_function_should_work_fine" do
    User.current = users(:user_11)
    assert_equal(User.get_states([Item.first, Item.second, Item.third]).values.to_s,"[1, 3, 4]")
  end

  test "get_items_by_user2_that_user1_wants_function_should_work_fine" do
    assert_equal(User.get_items_by_user2_that_user1_wants(users(:user_21), users(:user_11))[0],items(:item_1))
  end
end
