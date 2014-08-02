require 'rails_helper'

RSpec.describe "ages/index", :type => :view do
  before(:each) do
    assign(:ages, [
      Age.create!(
        :description => "Description"
      ),
      Age.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of ages" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
