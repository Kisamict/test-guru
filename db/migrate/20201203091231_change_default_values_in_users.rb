class ChangeDefaultValuesInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :fname, '')
    change_column_default(:users, :lname, '')
  end
end
