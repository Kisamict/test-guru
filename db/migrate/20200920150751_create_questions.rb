class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test

      t.timestamps
    end
  end
end
