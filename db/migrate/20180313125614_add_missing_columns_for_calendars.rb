class AddMissingColumnsForCalendars < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :trash, :boolean
    add_column :calendars, :food, :boolean
    add_column :calendars, :kitchen, :boolean
    add_column :calendars, :fridge, :boolean
  end
end
