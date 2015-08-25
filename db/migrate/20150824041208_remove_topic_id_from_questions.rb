class RemoveTopicIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :topic_id, :int
  end
end
