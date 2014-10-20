class BatchBlock < ActiveType::Object

  def self.clear_blocks_from_current_user
    blocks_to_delete = Block.where(user_id: User.current.id)
    blocks_to_delete.delete_all if blocks_to_delete.present?
    return true
  end

end
