class CreateTelephoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :telephone_numbers do |t|
      t.references :student, null: false, foreign_key: true
      t.string :number, null: false

      t.timestamps
    end
  end
end
