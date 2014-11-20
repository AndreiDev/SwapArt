require 'test_helper'

class GalleryTest < ActiveSupport::TestCase

  test "should return_exactly_max_items_per_page_items" do
    User.current = User.first
    gal1 = Gallery.new
    assert_equal(AppConfig.max_items_per_page,gal1.items.count.to_s)

    User.current = User.last
    gal2 = Gallery.new
    assert_equal(AppConfig.max_items_per_page,gal2.items.count.to_s)
  end

  test "should return_right_number_of_pages" do
    User.current = User.first
    gal1 = Gallery.new
    assert_equal((Item.all.count)/(AppConfig.max_items_per_page.to_i) + 1,gal1.number_of_pages)
  end

  test "should_filter_by_type" do
    User.current = User.first
    gal = Gallery.new(type: ActiveRecord::FixtureSet.identify(:type_31).to_s)
    assert_equal(3 ,gal.items.count)
  end

  test "should_filter_by_price" do
    User.current = User.first
    gal = Gallery.new(price: ActiveRecord::FixtureSet.identify(:price_21).to_s)
    assert_equal(2 ,gal.items.count)
  end

  test "should_filter_by_age" do
    User.current = User.first
    gal = Gallery.new(age: ActiveRecord::FixtureSet.identify(:age_21).to_s)
    assert_equal(4 ,gal.items.count)
  end

  test "should_filter_by_state" do
    User.current = User.first
    gal = Gallery.new(state: ActiveRecord::FixtureSet.identify(:state_11).to_s)
    assert_equal(2 ,gal.items.count)
  end

  test "should_filter_by_region" do
    User.current = User.first
    gal = Gallery.new(region: ActiveRecord::FixtureSet.identify(:region_21).to_s)
    assert_equal(7 ,gal.items.count)
  end

  test "should_filter_by_time" do
    User.current = User.first
    gal1 = Gallery.new(time: '4')
    assert_equal(AppConfig.max_items_per_page.to_i ,gal1.items.count)

    gal2 = Gallery.new(time: '1')
    assert_equal(AppConfig.max_items_per_page.to_i ,gal2.items.count)
  end

  test "should_filter_by_several_criteria" do
    User.current = User.first
    gal = Gallery.new(region: ActiveRecord::FixtureSet.identify(:region_31).to_s, type: ActiveRecord::FixtureSet.identify(:type_1).to_s, age: ActiveRecord::FixtureSet.identify(:age_21).to_s, state: ActiveRecord::FixtureSet.identify(:state_31).to_s)
    assert_equal(1 ,gal.items.count)
  end

  test "should_sort_right" do
    User.current = User.first
    gal = Gallery.new()
    assert_equal([4, 3, 3, 3, 3, 3, 3, 3] ,User.get_states(gal.items).values)
  end

end
