class AddSubjectToNotifications < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :description, :subject
    add_column :notifications, :description, :string
  end
end
