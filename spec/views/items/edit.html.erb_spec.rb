require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :user => nil,
      :type => nil,
      :description => "MyString",
      :image => "image.jpg",
      :price => nil,
      :height => 1,
      :width => 1,
      :age => nil,
      :state => nil,
      :is_active => false,
      :is_blocked => false
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_user_id[name=?]", "item[user_id]"

      assert_select "input#item_type_id[name=?]", "item[type_id]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_image[name=?]", "item[image]"

      assert_select "input#item_price[name=?]", "item[price]"

      assert_select "input#item_height[name=?]", "item[height]"

      assert_select "input#item_width[name=?]", "item[width]"

      assert_select "input#item_age_id[name=?]", "item[age_id]"

      assert_select "input#item_state_id[name=?]", "item[state_id]"

      assert_select "input#item_is_active[name=?]", "item[is_active]"

      assert_select "input#item_is_blocked[name=?]", "item[is_blocked]"
    end
  end
end
