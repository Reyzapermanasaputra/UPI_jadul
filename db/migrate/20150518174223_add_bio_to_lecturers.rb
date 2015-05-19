class AddBioToLecturers < ActiveRecord::Migration
  def change
    add_column :lecturers, :NIP, :string
    add_column :lecturers, :name, :string
    add_column :lecturers, :place, :string
    add_column :lecturers, :born, :date
    add_column :lecturers, :work_unit, :string
    add_column :lecturers, :address, :string
    add_column :lecturers, :phone, :string
  end
end
