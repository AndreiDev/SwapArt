require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "should create new item" do
    @user_51 = ActiveRecord::FixtureSet.identify(:user_51)
    @type_11 = ActiveRecord::FixtureSet.identify(:type_11)
    @price_21 = ActiveRecord::FixtureSet.identify(:price_21)
    @age_21 = ActiveRecord::FixtureSet.identify(:age_21)
    @state_11 = ActiveRecord::FixtureSet.identify(:state_11)
    item = Item.new(user_id: @user_51, type_id: @type_11, image_url: 'sample15.jpg', description: 'מתאימה לכל חדר',price_id: @price_21,height: '150',width: '110',age_id: @age_21,state_id: @state_11)
    assert item.save
  end

end
