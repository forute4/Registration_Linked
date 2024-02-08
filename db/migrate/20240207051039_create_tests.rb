class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.references :student, null: false, foreign_key: true
      t.integer :test_status
      t.string :test_name
      t.integer :english_score
      t.integer :math_score
      t.integer :japanese_score
      t.integer :science_score
      t.integer :social_score
      

      t.timestamps
    end
  end
end
