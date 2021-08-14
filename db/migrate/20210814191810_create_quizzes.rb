class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :quizzes, :slug, unique: true
  end
end
