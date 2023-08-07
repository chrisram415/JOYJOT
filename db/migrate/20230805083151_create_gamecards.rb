class CreateGamecards < ActiveRecord::Migration[7.0]
  def change
    create_table :gamecards do |t|
      t.boolean :solved, default: false
      t.text :image_url
      t.references :joy, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
