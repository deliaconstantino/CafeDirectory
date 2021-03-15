class FixColumnNameInCafes < ActiveRecord::Migration[6.1]
  def change
    rename_column :cafes, :open, :open_hour
    rename_column :cafes, :close, :close_hour
  end
end
