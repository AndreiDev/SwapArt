require 'rails_helper'

RSpec.describe "ages/edit", :type => :view do
  before(:each) do
    @age = assign(:age, Age.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit age form" do
    render

    assert_select "form[action=?][method=?]", age_path(@age), "post" do

      assert_select "input#age_description[name=?]", "age[description]"
    end
  end
end
