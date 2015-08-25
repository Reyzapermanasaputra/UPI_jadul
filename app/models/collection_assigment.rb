class CollectionAssigment < ActiveRecord::Base
  belongs_to :user
  belongs_to :assigment

  mount_uploader :attachment, AttachmentUploader
end
