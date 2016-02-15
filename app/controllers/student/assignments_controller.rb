class Student::AssignmentsController < ApplicationController

  before_action :authenticate_student!

  def index
    @current_assignments = current_student.assignments.joins(:homework)
                              .includes(:homework).where("due_at::date >= ?", Date.current)
                              .order("answers_count, homeworks.due_at")
    @past_assignments = current_student.assignments.joins(:homework)
                              .includes(:homework).where("due_at::date < ?", Date.current)
                              .order("answers_count, homeworks.due_at")
  end
end