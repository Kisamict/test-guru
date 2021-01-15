class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false 
      t.string :image_url, null: false
      t.integer :awarding_rule, default: 0, null: false

      t.timestamps
    end

    create_table :user_badges do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true

      t.integer :awards_counter, default: 1, null: false
    end
  end
end
