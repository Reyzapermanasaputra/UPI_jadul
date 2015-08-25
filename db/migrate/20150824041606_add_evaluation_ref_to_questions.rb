class AddEvaluationRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :evaluation, index: true, foreign_key: true
  end
end
