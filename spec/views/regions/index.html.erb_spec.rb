require 'rails_helper'

RSpec.describe "regions/index", :type => :view do
  before(:each) do
    assign(:regions, [
      Region.create!(
        :description => "Description"
      ),
      Region.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of regions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
