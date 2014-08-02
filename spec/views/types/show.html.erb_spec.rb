require 'rails_helper'

RSpec.describe "types/show", :type => :view do
  before(:each) do
    @type = assign(:type, Type.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
