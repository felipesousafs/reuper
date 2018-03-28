class RemoveTaskTypeAndAddResponseToNotifications < ActiveRecord::Migration[5.1]
  def change
    remove_column :notifications, :task_type
    add_column :notifications, :is_response, :boolean
  end
end
