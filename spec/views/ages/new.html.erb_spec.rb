require 'rails_helper'

RSpec.describe "ages/new", :type => :view do
  before(:each) do
    assign(:age, Age.new(
      :description => "MyString"
    ))
  end

  it "renders new age form" do
    render

    assert_select "form[action=?][method=?]", ages_path, "post" do

      assert_select "input#age_description[name=?]", "age[description]"
    end
  end
end
