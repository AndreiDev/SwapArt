class Item < ActiveRecord::Base

  validates :image_url, :presence => {:message => "יש להעלות תמונה"}
  validates :price, :presence => {:message => ""}
  validates :height, :presence => {:message => ""}
  validates :width, :presence => {:message => ""}
  validates :type, :presence => {:message => ""}
  validates :age, :presence => {:message => ""}
  validates :state, :presence => {:message => ""}

  belongs_to :user
  belongs_to :type
  belongs_to :age
  belongs_to :state
  belongs_to :price

  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :blocks
  has_many :block_users, :through => :blocks, :source => :user

  has_many :wants
  has_many :want_users, :through => :wants, :source => :user

  has_many :swaps_as_clicked_item, :class_name => 'Swap', :foreign_key => 'clicked_item_id'

  before_create :assign_current_user

  private

  def assign_current_user
    self.user_id ||= User.current.try(:id)
  end

end
