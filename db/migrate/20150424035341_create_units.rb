class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :topic_id
      t.string :content

      t.timestamps null: false
    end
  end
end
