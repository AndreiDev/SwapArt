class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.boolean :extra_mile?

      t.timestamps
    end
  end
end
