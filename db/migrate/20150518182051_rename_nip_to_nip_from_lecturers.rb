class RenameNipToNipFromLecturers < ActiveRecord::Migration
  def change
    rename_column :lecturers, :NIP, :nip
  end
end
