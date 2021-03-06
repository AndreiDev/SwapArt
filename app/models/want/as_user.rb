class Want::AsUser < ActiveType::Record[Want]
  after_create :calculate_state, :send_email_to_swapee
  after_destroy :calculate_state

  private

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