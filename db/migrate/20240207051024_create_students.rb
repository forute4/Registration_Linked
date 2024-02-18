class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :telephone_number, null:false
      t.string :address, null: false
      t.string :email, null: false
      t.string :post_code, null: false
      t.integer :grade, null: false
      t.string :school_name, null: false
      t.date :subscription_day, null: false
      t.integer :student_status, default: 1
      t.integer :situation_status, default: 1

      t.timestamps
    end
  end
end
