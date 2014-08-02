require 'rails_helper'

RSpec.describe "swaps/show", :type => :view do
  before(:each) do
    @swap = assign(:swap, Swap.create!(
      :user => nil,
      :user => nil,
      :user1_items => "MyText",
      :user2_items => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
