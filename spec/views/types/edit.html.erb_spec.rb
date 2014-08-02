require 'rails_helper'

RSpec.describe "types/edit", :type => :view do
  before(:each) do
    @type = assign(:type, Type.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit type form" do
    render

    assert_select "form[action=?][method=?]", type_path(@type), "post" do

      assert_select "input#type_description[name=?]", "type[description]"
    end
  end
end
