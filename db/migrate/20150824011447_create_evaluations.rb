class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :name
      t.string :password
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
