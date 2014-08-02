require 'rails_helper'

RSpec.describe "blocks/index", :type => :view do
  before(:each) do
    assign(:blocks, [
      Block.create!(
        :user => nil,
        :item => nil
      ),
      Block.create!(
        :user => nil,
        :item => nil
      )
    ])
  end

  it "renders a list of blocks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
