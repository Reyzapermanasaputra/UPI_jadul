class RemoveUserIdFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :user_id
  end
end
