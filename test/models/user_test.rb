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
end
