class AddTotalToScores < ActiveRecord::Migration
  def change
    add_column :scores, :total, :int
  end
end
