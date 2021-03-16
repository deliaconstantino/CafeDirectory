class ChangeCafeCategoriesToCafesCategory < ActiveRecord::Migration[6.1]
  def change
    rename_table :cafe_categories, :cafes_category
  end
end
