class RemoveGameReferenceFromJoys < ActiveRecord::Migration[7.0]
  def change
    remove_reference :joys, :game, null: false, foreign_key: true
  end
end
