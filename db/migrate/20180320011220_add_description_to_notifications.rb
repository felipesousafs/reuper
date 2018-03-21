class AddDescriptionToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :description, :string
  end
end
