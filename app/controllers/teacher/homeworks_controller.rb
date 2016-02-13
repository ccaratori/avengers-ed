class Teacher::HomeworksController < ApplicationController

  def index
    @homeworks = Homework.all
  end

  def new
    @homework = Homework.new
  end

  def edit
  end

  def show
  end

  def create
    @homework = Homework.new(homework_params)
 
    if @homework.save
      redirect_to teacher_homeworks_path
    else
      render :new
    end
  end

  def update
  end

  private

    def homework_params
      params.require(:homework).permit(:title, :question, :due_at)
    end
end