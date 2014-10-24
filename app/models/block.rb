class Block < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  before_create :assign_current_user
  after_create :delete_wants

  validates_presence_of :item_id

  private

  def assign_current_user
    self.user_id ||= User.current.try(:id)
  end

  def delete_wants
    want_to_delete = Want.find_by_user_id_and_item_id(self.user_id, self.item_id)
    want_to_delete.delete if want_to_delete.present?
  end

end
