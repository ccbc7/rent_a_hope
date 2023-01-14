class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :room_name
      t.string :room_introduction
      t.integer :charge
      t.string :adress
      t.string :img
      t.integer :user_id
      t.integer :room_id
      t.datetime :start_day
      t.datetime :end_day
      t.integer :people

      t.timestamps
    end
  end
end
