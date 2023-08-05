class CreateJoys < ActiveRecord::Migration[7.0]
  def change
    create_table :joys do |t|
      t.text :description
      t.text :fortune
      t.string :genre
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
