class AddImageToItem < ActiveRecord::Migration
  def change
    add_column :items, :image_url, :string, after: :state_id
  end
end
