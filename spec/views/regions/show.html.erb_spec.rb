require 'rails_helper'

RSpec.describe "regions/show", :type => :view do
  before(:each) do
    @region = assign(:region, Region.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
