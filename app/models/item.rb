class Item < ActiveRecord::Base

  validates :image_url, :presence => {:message => "יש להעלות תמונה"}
  validates :price, :presence => {:message => "price undefined"}
  validates :height, :presence => {:message => "height undefined"}
  validates :width, :presence => {:message => "width undefined"}
  validates :type, :presence => {:message => "type undefined"}
  validates :age, :presence => {:message => "age undefined"}
  validates :state, :presence => {:message => "state undefined"}

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
end
