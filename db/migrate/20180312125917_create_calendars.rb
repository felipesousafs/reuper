class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.boolean :is_holiday
      t.datetime :date
      t.datetime :inicio_semestre
      t.datetime :fim_semestre
      t.timestamps
    end
  end
end