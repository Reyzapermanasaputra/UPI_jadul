class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :question, index: true, foreign_key: true
      t.string :answer

      t.timestamps null: false
    end
  end
end
