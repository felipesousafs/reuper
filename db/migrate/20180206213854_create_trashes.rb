class CreateTrashes < ActiveRecord::Migration[5.1]
  def change
    create_table :trashes do |t|
      t.datetime :when
      t.integer :user_id
      t.boolean :done

      t.timestamps
    end
  end
end
