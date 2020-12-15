class RenameUsersAttributes < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :fname, :first_name
    rename_column :users, :lname, :last_name
  end
end
