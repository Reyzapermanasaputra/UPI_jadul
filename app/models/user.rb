class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :topics
  has_many :units

  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "Guess" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def author?
    self.role.name == "Author"
  end

  def guess?
    self.role.name == "Guess"
  end
end
