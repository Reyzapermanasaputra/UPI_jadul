class AddQuizRefToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :quiz, index: true, foreign_key: true
  end
end
