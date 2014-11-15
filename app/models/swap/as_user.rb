class Swap::AsUser < ActiveType::Record[Swap]
  before_create :prepare_swap_data

  private

  def prepare_swap_data
    @item = Item.find self.clicked_item_id
    @user = User.find self.swappee_id
    @current_user = User.find self.swapper_id
    self.swapper_items = User.get_items_by_user2_that_user1_wants(@user, @current_user).map{|item| item.id}.to_s
    self.swappee_items = User.get_items_by_user2_that_user1_wants(@current_user, @user).map{|item| item.id}.to_s
  end

end