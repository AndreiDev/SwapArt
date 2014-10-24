class Want < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  before_create :assign_current_user
  after_create :calculate_state, :send_email_to_swapee
  after_destroy :calculate_state

  validates_presence_of :item_id

  attr_accessor :state

  private

  def assign_current_user
    self.user_id = User.current.try(:id)
  end

  def calculate_state
    self.state = User.get_states([self.item])[self.item.id]
  end

  def send_email_to_swapee
    # send an email to the other user that a swap is awaiting
    if self.state == 4
      user_swapping_with = Item.find(self['item_id']).user
      if user_swapping_with.swap_informed_at.nil? || (user_swapping_with.swap_informed_at.present? && user_swapping_with.swap_informed_at < Time.now - 1.hours)
        SwapMailer.inform(user_swapping_with).deliver
        user_swapping_with.swap_informed_at = Time.now
        user_swapping_with.save
      end
    end
  end
end
