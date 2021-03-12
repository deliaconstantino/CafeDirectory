class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :cafe, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
