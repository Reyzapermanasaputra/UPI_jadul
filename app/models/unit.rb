class Unit < ActiveRecord::Base
  #relations unit belongs to topic
  belongs_to :topic
  belongs_to :user
  has_many :contents, :dependent => :destroy
  accepts_nested_attributes_for :contents, allow_destroy: true, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true
  has_many :comments, :as => :commentable
end
