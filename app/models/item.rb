class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  belongs_to :age
  belongs_to :state
end
