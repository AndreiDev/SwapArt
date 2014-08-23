require 'rails_helper'

RSpec.describe "items/index", :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :user => nil,
        :type => nil,
        :description => "Description",
        :image => "/image.jpg",
        :price => 1,
        :height => 2,
        :width => 3,
        :age => nil,
        :state => nil,
        :is_active => false,
        :is_blocked => false
      ),
      Item.create!(
        :user => nil,
        :type => nil,
        :description => "Description",
        :image => "/image.jpg",
        :price => nil,
        :height => 2,
        :width => 3,
        :age => nil,
        :state => nil,
        :is_active => false,
        :is_blocked => false
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
