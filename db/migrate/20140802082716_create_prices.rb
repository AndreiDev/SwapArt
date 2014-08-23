class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :description

      t.timestamps
    end
  end
end
