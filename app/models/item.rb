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
  after_update :remove_wants_of_inactive_item, :remove_s3_image
  after_destroy :remove_s3_image

  private

  def assign_current_user
    self.user_id = User.current.try(:id)
  end

  def remove_wants_of_inactive_item
    if self.is_active_changed? && self.is_active == false
      self.wants.all.delete_all
    end
  end

  def remove_s3_image
    if self.destroyed?
      S3_BUCKET.objects[self.image_url].delete
    elsif self.image_url_changed?
      S3_BUCKET.objects[self.image_url_was].delete
    end
  end

end
