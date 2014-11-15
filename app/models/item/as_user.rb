class Item::AsUser < ActiveType::Record[Item]
  after_update :remove_wants_of_inactive_item, :remove_s3_image
  after_destroy :remove_s3_image

  private

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
