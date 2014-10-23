class Swap < ActiveRecord::Base
  belongs_to :swapper, :class_name => "User", :foreign_key => 'swapper_id'
  belongs_to :swappee, :class_name => "User", :foreign_key => 'swappee_id'
  belongs_to :clicked_item, :class_name => "Item", :foreign_key => 'clicked_item_id'

  before_create :assign_current_user, :prepare_swap_data

  private

  def assign_current_user
    self.swapper_id = User.current.id
  end

  def prepare_swap_data
    @item = Item.find self.clicked_item_id
    @user = User.find self.swappee_id
    @current_user = User.find self.swapper_id
    self.swapper_items = User.get_items_by_user2_that_user1_wants(@user, @current_user).map{|item| item.id}.to_s
    self.swappee_items = User.get_items_by_user2_that_user1_wants(@current_user, @user).map{|item| item.id}.to_s
  end

end
