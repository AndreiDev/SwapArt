require 'rails_helper'

RSpec.describe "wants/index", :type => :view do
  before(:each) do
    assign(:wants, [
      Want.create!(
        :user => nil,
        :item => nil,
        :extra_mile => false
      ),
      Want.create!(
        :user => nil,
        :item => nil,
        :extra_mile => false
      )
    ])
  end

  it "renders a list of wants" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
