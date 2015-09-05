class ChangeDataTypeToScores < ActiveRecord::Migration
  def change
    change_column :scores, :value,'boolean USING CAST(value AS boolean)'
  end
end
