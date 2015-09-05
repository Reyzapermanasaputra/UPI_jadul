class ChangeStringToScores < ActiveRecord::Migration
  def change
    change_column :scores, :value, :string
  end
end
