class AddTopicToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :topic_id, :string
  end
end
