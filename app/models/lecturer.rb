class Lecturer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  before_save :assign_role
  def assign_role
    self.role = Role.find_by name: "Lecturer"
  end

  def lecturer?
    self.role.name == "Lecturer"
  end

end
