class AddStartDayToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :start_day, :datetime
  end
end
