class CreateAssigments < ActiveRecord::Migration
  def change
    create_table :assigments do |t|
      t.string :title
      t.date :due_time
      t.string :description
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
