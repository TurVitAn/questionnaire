class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.references :quiz, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
    add_index :steps, %i[quiz_id position], unique: true
  end
end
