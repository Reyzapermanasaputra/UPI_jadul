class RemoveEmailFromLecturers < ActiveRecord::Migration
  def change
    remove_column :lecturers, :email
  end
end
