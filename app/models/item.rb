class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  belongs_to :age
  belongs_to :state

  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :blocks
  has_many :users, :through => :blocks

  has_many :wants
  has_many :users, :through => :wants
end
