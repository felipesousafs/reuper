class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reg_number, :integer
    add_column :users, :name, :string
    add_column :users, :course_id, :integer
    add_column :users, :room_id, :integer
  end
end
