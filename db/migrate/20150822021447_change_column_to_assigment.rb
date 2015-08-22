class ChangeColumnToAssigment < ActiveRecord::Migration
  def change
    change_column :assigments, :due_time, :string
  end
end
