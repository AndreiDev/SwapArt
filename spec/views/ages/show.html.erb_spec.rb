require 'rails_helper'

RSpec.describe "ages/show", :type => :view do
  before(:each) do
    @age = assign(:age, Age.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
