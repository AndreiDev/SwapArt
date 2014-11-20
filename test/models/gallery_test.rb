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
    assert_equal((Item.all.count)/(AppConfig.max_items_per_page) + 1,gal1.number_of_pages.to_s)
  end

end
