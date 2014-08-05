require 'rails_helper'

RSpec.describe "wants/new", :type => :view do
  before(:each) do
    assign(:want, Want.new(
      :user => nil,
      :item => nil,
      :extra_mile => false
    ))
  end

  it "renders new want form" do
    render

    assert_select "form[action=?][method=?]", wants_path, "post" do

      assert_select "input#want_user_id[name=?]", "want[user_id]"

      assert_select "input#want_item_id[name=?]", "want[item_id]"

      assert_select "input#want_extra_mile[name=?]", "want[extra_mile]"
    end
  end
end
