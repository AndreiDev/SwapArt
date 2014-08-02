require 'rails_helper'

RSpec.describe "states/show", :type => :view do
  before(:each) do
    @state = assign(:state, State.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
