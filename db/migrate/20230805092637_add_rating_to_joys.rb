class AddRatingToJoys < ActiveRecord::Migration[7.0]
  def change
    add_column :joys, :rating, :integer, default: 0
  end
end
