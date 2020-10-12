class AddAuthorToTest < ActiveRecord::Migration[5.0]
  def change
    add_reference :tests, :author
  end
end
