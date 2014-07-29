class AddColumnsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :uid, :string

    add_column :users, :name, :string #full name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string

  end

end
