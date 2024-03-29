class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :body
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
