class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.references :user, index: true
      t.references :item, index: true

      t.timestamps
    end
  end
end
