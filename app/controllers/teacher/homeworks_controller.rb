class Teacher::HomeworksController < ApplicationController

  before_action :authenticate_teacher!

  def index
    @current_homeworks = current_teacher.homeworks.where("due_at >= ?", Date.current.end_of_day)
    @past_homeworks = current_teacher.homeworks.where("due_at < ?", Date.current.end_of_day)
  end

  def new
    @homework = Homework.new
  end

  def show
    @homework = current_teacher.homeworks.find(params[:id])
    @unassigned_students = User.student.where.not(id: @homework.assignments.pluck(:user_id))
  end

  def create
    @homework = current_teacher.homeworks.new(homework_params)
 
    if @homework.save
      redirect_to teacher_homeworks_path
    else
      render :new
    end
  end

  def update
    @homework = current_teacher.homeworks.find(params[:id])
 
    if @homework.update_attributes(homework_params)
      redirect_to teacher_homework_path(@homework)
    else
      render :show
    end
  end

  private

    def homework_params
      params.require(:homework).permit(:title, :question, :due_at)
    end
end