class Item < ActiveRecord::Base

  validates :image_url, :presence => {:message => ""}
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
end
