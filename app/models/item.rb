class Item < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
