class TeachercoursesController < ApplicationController

  def index


  end

  def show
    @teachercourse_array = Course.joins(:users).where(:user_courses => {:user_id => current_user.id, :user_type => "teacher", :course_id => params[:id]})

    p "================================"

    # @chapters = Chapter.where(:course_id => )
  end


end
