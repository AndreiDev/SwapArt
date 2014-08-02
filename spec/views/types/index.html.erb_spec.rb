require 'rails_helper'

RSpec.describe "types/index", :type => :view do
  before(:each) do
    assign(:types, [
      Type.create!(
        :description => "Description"
      ),
      Type.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of types" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
