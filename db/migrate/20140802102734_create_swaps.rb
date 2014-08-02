class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.belongs_to :user1, index: true
      t.belongs_to :user2, index: true
      t.text :user1_items
      t.text :user2_items

      t.timestamps
    end
  end
end
