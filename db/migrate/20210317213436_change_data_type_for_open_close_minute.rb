class ChangeDataTypeForOpenCloseMinute < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      change_table :cafes do |t|
        dir.up   { t.change :open_minute, :string }
        dir.down { t.change :open_minute, :integer }
        dir.up   { t.change :close_minute, :string }
        dir.down { t.change :close_minute, :integer }
      end
    end
  end
end
