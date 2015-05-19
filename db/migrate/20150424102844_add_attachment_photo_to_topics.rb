class AddAttachmentPhotoToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :topics, :photo
  end
end
