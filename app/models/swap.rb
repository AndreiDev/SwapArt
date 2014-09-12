class Swap < ActiveRecord::Base
  belongs_to :swapper, :class_name => "User", :foreign_key => 'swapper_id'
  belongs_to :swappee, :class_name => "User", :foreign_key => 'swappee_id'
end
