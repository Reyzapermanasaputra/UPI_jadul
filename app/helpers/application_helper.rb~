module ApplicationHelper

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end

  def current_user?(user)
    user == current_user
  end

  def admin?
    current_user.role.name == "Admin"
  end

  def lecturer?
    current_user.role.name == "Lecturer"
  end

  def current_student?
    current_user.role.name == "Student"
  end

  def student?
    @user.role.name == "Student"
  end

  def flash_class(type)
    case type.to_sym
      when :notice then "alert alert-success"
      when :info then "alert alert-info"
      when :alert then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end
end
