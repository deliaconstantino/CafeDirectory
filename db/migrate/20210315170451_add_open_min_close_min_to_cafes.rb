class AddOpenMinCloseMinToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :open_minute, :integer
    add_column :cafes, :close_minute, :integer
  end
end
