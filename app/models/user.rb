class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  include User::AuthDefinitions

  has_one :identity
  belongs_to :region
  has_many :items

  has_many :blocks
  has_many :block_items, :through => :blocks, :source => :item

  has_many :wants
  has_many :want_items, :through => :wants, :source => :item

  has_many :swaps_as_swapper, :class_name => 'Swap', :foreign_key => 'swapper_id'
  has_many :swaps_as_swappee, :class_name => 'Swap', :foreign_key => 'swappee_id'

  has_and_belongs_to_many :roles, join_table: :users_roles
  accepts_nested_attributes_for :roles, allow_destroy: false

  validates_associated :roles
  validates_presence_of :email, :first_name, :last_name

  validates_uniqueness_of :email, case_sensitive: false
  validates :email, length: {minimum: 7, maximum: 50}
  validates_format_of :email, with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i,
                      allow_blank: true,
                      message: I18n.t("model.messages.emailError")

  after_destroy :clear_identity

  def clear_identity
    self.identity_was.destroy if self.identity_was.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # ROLE
  def set_def_role
    role = Role.find_by_flg_default(1)
    self.add_role role.name
  end

  def get_user_roles_id
    user_roles = self.roles.collect { |i| i.id }
  end

  def get_user_roles_name
    user_roles = self.roles.collect { |i| i.name }
    user_roles.join(", ") unless self.roles.first.nil?
  end

  def self.get_states(items)
    users_that_want_my_items = User.find_by_sql ["SELECT DISTINCT users.*
    FROM users
    LEFT JOIN wants on users.id = wants.user_id
    LEFT JOIN items on wants.item_id = items.id
    WHERE users.is_active = 1 AND users.is_blocked = 0
    AND items.user_id = '?'", User.current.try(:id)]

    states = {}
    items.each { |item|
      user_wants_item = item.want_users.include? User.current
      item_owner_wants_users_item = users_that_want_my_items.include? item.user
      case [user_wants_item, item_owner_wants_users_item]
        when [false, false]
          states[item.id] = 1
        when [true, false]
          states[item.id] = 2
        when [false, true]
          states[item.id] = 3
        when [true, true]
          states[item.id] = 4
      end
    }
    return states
  end

  def self.get_items_by_user2_that_user1_wants(user1, user2)
    return Item.find_by_sql ["SELECT DISTINCT items.*
    FROM users
    LEFT JOIN wants on users.id = wants.user_id
    LEFT JOIN items on wants.item_id = items.id
    WHERE users.id = '?' AND items.user_id = '?'", user1.id, user2.id]
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

end
