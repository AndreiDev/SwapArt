class Swap < ActiveRecord::Base
  belongs_to :swapper, :class_name => "User", :foreign_key => 'swapper_id'
  belongs_to :swappee, :class_name => "User", :foreign_key => 'swappee_id'
  belongs_to :clicked_item, :class_name => "Item", :foreign_key => 'clicked_item_id'

  before_create :assign_current_user, :prepare_swap_data

  private

  def assign_current_user
    self.swapper_id ||= User.current.try(:id)
  end

end
