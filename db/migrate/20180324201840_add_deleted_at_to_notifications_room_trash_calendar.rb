class AddDeletedAtToNotificationsRoomTrashCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :trashes, :deleted_at, :datetime
    add_index :trashes, :deleted_at

    add_column :rooms, :deleted_at, :datetime
    add_index :rooms, :deleted_at

    add_column :notifications, :deleted_at, :datetime
    add_index :notifications, :deleted_at

    add_column :calendars, :deleted_at, :datetime
    add_index :calendars, :deleted_at
  end
end
