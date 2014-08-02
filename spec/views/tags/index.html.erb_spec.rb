require 'rails_helper'

RSpec.describe "tags/index", :type => :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(
        :description => "Description"
      ),
      Tag.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
