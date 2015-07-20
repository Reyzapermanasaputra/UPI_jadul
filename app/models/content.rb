class Content < ActiveRecord::Base
  belongs_to :unit
  has_many :comments, :as => :commentable
end
