class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  before_create :assign_current_user

  validates_presence_of :item_id

  attr_accessor :state

  private

  def assign_current_user
    self.user_id ||= User.current.try(:id)
  end

end
