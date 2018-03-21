class ChangeTypeToTableTypeInNotifications < ActiveRecord::Migration[5.1]
  def change
    remove_column :notifications, :type
    add_column :notifications, :table_type, :string
  end
end
