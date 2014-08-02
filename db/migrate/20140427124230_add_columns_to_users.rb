class AddColumnsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string

    add_column :users, :region_id, :integer, :null => false, :default => 1
    add_index :users, :region_id

    add_column :users, :is_active?, :boolean, :null => false, :default => true
    add_column :users, :is_blocked?, :boolean, :null => false, :default => false

  end

end
