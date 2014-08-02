require 'rails_helper'

RSpec.describe "wants/show", :type => :view do
  before(:each) do
    @want = assign(:want, Want.create!(
      :user => nil,
      :item => nil,
      :extra_mile? => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
