class AddEndDayToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :end_day, :datetime
  end
end
