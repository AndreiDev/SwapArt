require 'rails_helper'

RSpec.describe "states/index", :type => :view do
  before(:each) do
    assign(:states, [
      State.create!(
        :description => "Description"
      ),
      State.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of states" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
