class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :from
      t.string :type
      t.string :task_type
      t.integer :task_id
      t.integer :user_id
      t.boolean :read

      t.timestamps
    end
  end
end
