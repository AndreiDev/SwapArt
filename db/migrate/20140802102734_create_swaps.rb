class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.references :swapper, index: true
      t.references :swappee, index: true
      t.text :swapper_items
      t.text :swappee_items

      t.timestamps
    end
  end
end
