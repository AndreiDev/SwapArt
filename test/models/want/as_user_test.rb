require 'test_helper'

class Want::AsUserTest < ActiveSupport::TestCase

  test "should send_a_want_email" do
    User.current = users(:user_21)
    was = Want::AsUser.new(user_id: users(:user_21).id, item_id: items(:item_21).id)
    was.item = items(:item_21)
    was.save
    mail = ActionMailer::Base.deliveries.last
    assert_equal 'SwapArt notification <notification@swapart.co>', mail['from'].to_s
  end

end
