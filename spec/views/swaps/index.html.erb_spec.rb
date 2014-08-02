require 'rails_helper'

RSpec.describe "swaps/index", :type => :view do
  before(:each) do
    assign(:swaps, [
      Swap.create!(
        :user => nil,
        :user => nil,
        :user1_items => "MyText",
        :user2_items => "MyText"
      ),
      Swap.create!(
        :user => nil,
        :user => nil,
        :user1_items => "MyText",
        :user2_items => "MyText"
      )
    ])
  end

  it "renders a list of swaps" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
