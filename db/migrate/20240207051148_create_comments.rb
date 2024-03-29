class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
