class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate_teacher!
    redirect_to login_url unless current_teacher
  end

  def authenticate_student!
    redirect_to login_url unless current_student
  end

  def current_teacher
    @current_teacher ||= session[:user_id] && User.teacher.find_by(id: session[:user_id])
  end
  helper_method :current_teacher

  def current_student
    @current_student ||= session[:user_id] && User.student.find(session[:user_id])
  end
  helper_method :current_student

  def current_user
    @current_user ||= current_teacher || current_student
  end
  helper_method :current_user

  def root_path
    if current_user.teacher?
      teacher_homeworks_path
    else
      student_assignments_path
    end
  end
  helper_method :root_path
end
