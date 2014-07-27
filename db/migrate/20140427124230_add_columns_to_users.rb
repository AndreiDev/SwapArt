class AddColumnsToUsers < ActiveRecord::Migration
  def up

    # Add New columns
    add_column :users, :uid, :string

    add_column :users, :name, :string #full name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :birthday, :date

  end

  def down
    # Remove New columns
    remove_column :users, :uid, :string

    remove_column :users, :name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :nickname, :string
    remove_column :users, :birthday, :date

  end

end
