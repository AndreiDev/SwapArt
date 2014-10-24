class UserItem < ActiveType::Object

  # object fields
  attribute :swappee_id, :integer
  attribute :my_items_user_wants, :array

  # inner parameters
  attribute :items, :array
  attribute :states, :array
  attribute :user_id

  belongs_to :swappee, class_name: 'User'

  after_initialize :assign_current_user, :prepare_user_data

  private

  def assign_current_user
    self.user_id = User.current.id
  end

  def prepare_user_data
    self.swappee = User.find(swappee_id)

    self.items = Item
    .where(:user_id => swappee_id)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .where.not(id: User.find(self.user_id).block_items.pluck(:id))

    self.states = User.get_states(self.items)
    self.my_items_user_wants = User.get_items_by_user2_that_user1_wants(self.swappee, User.find(self.user_id))
  end

end