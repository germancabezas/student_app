class StudentcoursesController < ApplicationController

  def index

  end

  def show
    @course = Course.find(params[:id])

    @studentcourse_array = Course.joins(:users).where(:user_courses => {:course_id => params[:id]})
    p "==================="
    # p @studentcourse_array
  end


end
