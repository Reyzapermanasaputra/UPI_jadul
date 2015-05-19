class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name_course
      t.string :code_course
      t.string :sks
      t.string :program_study
      t.string :semester
      t.string :prerequisite
      t.string :description
      t.belongs_to :lecturer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
