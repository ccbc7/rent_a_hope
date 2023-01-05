class RenameAdressColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :adress, :address
  end
end
