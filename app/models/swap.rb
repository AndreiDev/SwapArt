class Swap < ActiveRecord::Base
  belongs_to :swapper, :class_name => "User", :foreign_key => 'swapper_id'
  belongs_to :swappee, :class_name => "User", :foreign_key => 'swappee_id'
  belongs_to :clicked_item, :class_name => "Item", :foreign_key => 'clicked_item_id'
end
