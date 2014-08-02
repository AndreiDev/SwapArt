require 'rails_helper'

RSpec.describe "blocks/edit", :type => :view do
  before(:each) do
    @block = assign(:block, Block.create!(
      :user => nil,
      :item => nil
    ))
  end

  it "renders the edit block form" do
    render

    assert_select "form[action=?][method=?]", block_path(@block), "post" do

      assert_select "input#block_user_id[name=?]", "block[user_id]"

      assert_select "input#block_item_id[name=?]", "block[item_id]"
    end
  end
end
