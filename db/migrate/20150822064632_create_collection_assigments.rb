class CreateCollectionAssigments < ActiveRecord::Migration
  def change
    create_table :collection_assigments do |t|
      t.string :attachment
      t.references :user, index: true, foreign_key: true
      t.belongs_to :assigment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
