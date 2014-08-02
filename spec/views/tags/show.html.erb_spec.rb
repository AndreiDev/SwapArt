require 'rails_helper'

RSpec.describe "tags/show", :type => :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
