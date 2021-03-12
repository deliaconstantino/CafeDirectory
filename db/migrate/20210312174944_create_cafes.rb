class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :speciality
      t.boolean :table_chair_seating
      t.boolean :cushioned_seating
      t.boolean :outdoor_seating
      t.boolean :wifi
      t.boolean :food

      t.timestamps
    end
  end
end
