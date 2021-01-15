class AddColumnPassedToTestPassages < ActiveRecord::Migration[5.0]
  def change
    add_column :test_passages, :passed, :boolean, default: false, null: false 
  end
end
