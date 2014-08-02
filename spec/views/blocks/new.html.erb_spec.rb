require 'rails_helper'

RSpec.describe "blocks/new", :type => :view do
  before(:each) do
    assign(:block, Block.new(
      :user => nil,
      :item => nil
    ))
  end

  it "renders new block form" do
    render

    assert_select "form[action=?][method=?]", blocks_path, "post" do

      assert_select "input#block_user_id[name=?]", "block[user_id]"

      assert_select "input#block_item_id[name=?]", "block[item_id]"
    end
  end
end
