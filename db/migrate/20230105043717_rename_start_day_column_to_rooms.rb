class RenameStartDayColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :start_day, :start_date
    rename_column :rooms, :end_day, :end_date
  end
end
