class RenameStartDayColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :end_day, :end_date
    rename_column :reservations, :start_day, :start_date
    rename_column :reservations, :adress, :address
  end
end
