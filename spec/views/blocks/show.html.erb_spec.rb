require 'rails_helper'

RSpec.describe "blocks/show", :type => :view do
  before(:each) do
    @block = assign(:block, Block.create!(
      :user => nil,
      :item => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
