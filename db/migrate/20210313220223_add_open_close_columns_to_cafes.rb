class AddOpenCloseColumnsToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :open, :integer
    add_column :cafes, :close, :integer
  end
end
