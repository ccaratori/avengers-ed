class Student::AnswersController < ApplicationController

  before_action :authenticate_student!

  def new
    @assignment = current_student.assignments.find(params[:assignment_id])
    @answer = Answer.new

    if @assignment.homework.expired?
      flash.now[:alert] = "Ops! You missed this assignment's deadline"
      redirect student_assignments_path
    end    
  end

  def create
    byebug
    @assignment = current_student.assignments.find(params[:assignment_id])
    @answer = @assignment.answers.new(answer_params)

    if @assignment.homework.expired?
      flash.now[:alert] = "Ops! You missed this assignment's deadline"
      redirect_to student_assignments_path
    elsif @answer.save
      flash.now[:notice] = "Good job, answer submited!"
      redirect_to student_assignments_path
    else
      render :new
    end
      
  end

  private

    def answer_params
      params.require(:answer).permit(:text)
    end
end