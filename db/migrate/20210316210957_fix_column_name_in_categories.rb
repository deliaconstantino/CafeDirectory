class FixColumnNameInCategories < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :names, :name
  end
end
