class Topic < ActiveRecord::Base
  has_many :units, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  #file image upload
  has_attached_file :avatar, :style => { :medium => "120x100>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpg', 'image/png', 'image/jpeg']
end
