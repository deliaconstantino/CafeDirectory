class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|

      t.timestamps
    end
  end
end
