class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_introduction
      t.integer :charge
      t.string :adress
      t.string :img

      t.timestamps
    end
  end
end
