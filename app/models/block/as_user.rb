class Block::AsUser < ActiveType::Record[Block]
  after_create :delete_wants

  private

  def delete_wants
    want_to_delete = Want.find_by_user_id_and_item_id(self.user_id, self.item_id)
    want_to_delete.delete if want_to_delete.present?
  end
end