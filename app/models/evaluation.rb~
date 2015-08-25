class Evaluation < ActiveRecord::Base
  belongs_to :topic
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:text].blank? }, allow_destroy: true
end
