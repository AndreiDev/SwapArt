class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.references :type, index: true
      t.string :description
      t.references :price, index: true
      t.integer :height, :null => false
      t.integer :width, :null => false
      t.references :age, index: true
      t.references :state, index: true
      t.boolean :is_active, :null => false, :default => true
      t.boolean :is_blocked, :null => false, :default => false

      t.timestamps
    end
  end
end
