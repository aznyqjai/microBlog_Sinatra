class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name, default: ''
      t.string :room_number
      t.string :hotel_name, default: ''
      t.string :address, default: ''
      t.string :city, default: ''
      t.string :zip, default: ''

      t.timestamps
    end

    create_table :reservations do |t|
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
