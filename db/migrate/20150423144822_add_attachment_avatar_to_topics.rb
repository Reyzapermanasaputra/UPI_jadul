class AddAttachmentAvatarToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :topics, :avatar
  end
end
