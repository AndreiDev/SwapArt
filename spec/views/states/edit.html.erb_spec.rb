require 'rails_helper'

RSpec.describe "states/edit", :type => :view do
  before(:each) do
    @state = assign(:state, State.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit state form" do
    render

    assert_select "form[action=?][method=?]", state_path(@state), "post" do

      assert_select "input#state_description[name=?]", "state[description]"
    end
  end
end