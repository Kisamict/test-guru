class ChangeTestsAuthorIdDeafaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:tests, :author_id, from: nil, to: 1)
  end
end
