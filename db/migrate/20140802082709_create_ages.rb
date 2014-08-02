class CreateAges < ActiveRecord::Migration
  def change
    create_table :ages do |t|
      t.string :description

      t.timestamps
    end
  end
end
