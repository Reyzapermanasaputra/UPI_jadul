class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :answer
      t.references :user, index: true, foreign_key: true
      t.references :evaluation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
