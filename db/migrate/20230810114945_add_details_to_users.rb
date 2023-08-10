class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :location, :string
  end
end
