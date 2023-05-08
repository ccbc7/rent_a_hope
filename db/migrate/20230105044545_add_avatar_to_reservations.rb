class AddAvatarToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :avatar, :string
  end
end
