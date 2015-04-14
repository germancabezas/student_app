class UsercoursesController < ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
    @user_courses = current_user.courses
    @user_courses_teaching = Course.joins(:users).where(:user_courses => {:user_id => current_user.id, :user_type => "teacher"})

    @user_courses_learning = Course.joins(:users).where(:user_courses => {:user_id => current_user.id, :user_type => "student"})
      
  end



  def show
    @user = User.find(params[:id])


  end

  def create
    @course = Course.find(params[:id])
    @bookshelf = UserCourse.create(:user_id => params[:user_id], :course_id => params[:course_id], :user_type => "student")
    flash[:success] = "This Course has been Saved to your Bookshelf"
    redirect_to "/studentcourses/#{@course.id}"
  end

end

