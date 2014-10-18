class Age < ActiveRecord::Base
  scope :blank_scope, -> { where('') }
end
