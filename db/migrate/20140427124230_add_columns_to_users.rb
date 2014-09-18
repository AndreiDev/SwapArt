class AddColumnsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :first_name, :string, :after => :email
    add_column :users, :last_name, :string, :after => :first_name
    add_column :users, :phone, :string, :after => :last_name

    add_column :users, :region_id, :integer, :null => false, :default => 1, :after => :phone
    add_index :users, :region_id

    add_column :users, :is_active, :boolean, :null => false, :default => true, :after => :region_id
    add_column :users, :is_blocked, :boolean, :null => false, :default => false, :after => :is_active

    add_column :users, :swap_informed_at, :datetime, :after => :is_blocked

  end
end
