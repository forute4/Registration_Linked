class CreateTargetNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :target_numbers do |t|
      t.string :target_name
      t.date :start_day
      t.date :finish_day
      t.integer :subscription_number
      t.integer :continue_number

      t.timestamps
    end
  end
end
