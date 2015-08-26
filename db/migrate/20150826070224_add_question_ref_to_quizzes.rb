class AddQuestionRefToQuizzes < ActiveRecord::Migration
  def change
    add_reference :quizzes, :question, index: true, foreign_key: true
  end
end
