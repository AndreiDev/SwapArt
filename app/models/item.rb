class Item < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 4.megabytes, :more_than => 0.2.megabytes

  belongs_to :user
  belongs_to :type
  belongs_to :age
  belongs_to :state

  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :blocks
  has_many :block_users, :through => :blocks, :source => :user

  has_many :wants
  has_many :want_users, :through => :wants, :source => :user
end
