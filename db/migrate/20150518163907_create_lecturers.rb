class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :nip
      t.string :name
      t.string :place
      t.date :birth
      t.string :work_unit
      t.string :address
      t.string :phone
      t.string :email
      t.belongs_to :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
