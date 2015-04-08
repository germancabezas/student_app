class StudentcoursesController < ApplicationController

  def index

  end

  def show
    @studentcourse_array = Course.joins(:users).where(:user_courses => {:user_id => current_user.id, :user_type => "student", :course_id => params[:id]})
    
  end


end
