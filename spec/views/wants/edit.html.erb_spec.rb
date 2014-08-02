require 'rails_helper'

RSpec.describe "wants/edit", :type => :view do
  before(:each) do
    @want = assign(:want, Want.create!(
      :user => nil,
      :item => nil,
      :extra_mile? => false
    ))
  end

  it "renders the edit want form" do
    render

    assert_select "form[action=?][method=?]", want_path(@want), "post" do

      assert_select "input#want_user_id[name=?]", "want[user_id]"

      assert_select "input#want_item_id[name=?]", "want[item_id]"

      assert_select "input#want_extra_mile?[name=?]", "want[extra_mile?]"
    end
  end
end
