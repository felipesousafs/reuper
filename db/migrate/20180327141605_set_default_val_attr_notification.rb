class SetDefaultValAttrNotification < ActiveRecord::Migration[5.1]
  def change
    change_column :notifications, :is_response, :boolean, :default => false
    change_column :notifications, :read, :boolean, :default => false
  end
end
