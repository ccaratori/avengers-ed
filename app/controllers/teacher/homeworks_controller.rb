class Teacher::HomeworksController < ApplicationController

  before_action :authenticate_teacher!

  def index
    @current_homeworks = current_teacher.homeworks.where("due_at >= ?", Date.current.end_of_day)
    @past_homeworks = current_teacher.homeworks.where("due_at < ?", Date.current.end_of_day)
  end

  def new
    @homework = Homework.new
  end

  def create
    @homework = current_teacher.homeworks.new(homework_params)
 
    if @homework.save
      redirect_to teacher_homeworks_path
    else
      render :new
    end
  end

  private

    def homework_params
      params.require(:homework).permit(:title, :question, :due_at)
    end
end