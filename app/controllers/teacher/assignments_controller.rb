class Teacher::AssignmentsController < ApplicationController

  before_action :authenticate_teacher!

  def show
    @assignment = current_teacher.homeworks.find(params[:homework_id]).assignments.find(params[:id])
  end

  def create
    @homework = current_teacher.homeworks.find(params[:homework_id])
 
    @assignment = @homework.assignments.new(assignment_params)

    if @assignment.save
      redirect_to teacher_homework_path(@homework)
    else
      render :new
    end
  end

  private

    def assignment_params
      params.require(:assignment).permit(:user_id)
    end
end