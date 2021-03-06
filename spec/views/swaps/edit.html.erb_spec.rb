require 'rails_helper'

RSpec.describe "swaps/edit", :type => :view do
  before(:each) do
    @swap = assign(:swap, Swap.create!(
      :user => nil,
      :user => nil,
      :user1_items => "MyText",
      :user2_items => "MyText"
    ))
  end

  it "renders the edit swap form" do
    render

    assert_select "form[action=?][method=?]", swap_path(@swap), "post" do

      assert_select "input#swap_user_id[name=?]", "swap[user_id]"

      assert_select "input#swap_user_id[name=?]", "swap[user_id]"

      assert_select "textarea#swap_user1_items[name=?]", "swap[user1_items]"

      assert_select "textarea#swap_user2_items[name=?]", "swap[user2_items]"
    end
  end
end
