class CreateCafeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :cafe_categories do |t|
      t.references :cafe, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
