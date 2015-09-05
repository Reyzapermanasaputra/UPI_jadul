class Quiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :evaluation
  has_many :tasks, dependent: :destroy
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :tasks
end
