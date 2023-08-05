class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.text :activity
      t.integer :rating, default: 0
      t.string :genre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
