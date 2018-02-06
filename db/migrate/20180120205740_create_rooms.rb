class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :number
      t.string :floor

      t.timestamps
    end
  end
end
