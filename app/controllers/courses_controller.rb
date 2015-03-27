class CoursesController < ApplicationController

  def index
    @courses = Course.all
    if params[:search]
      @courses = @courses.where('Name LIKE ?', "%" + params[:search] + "%")
    end
    @alphabet = ("A".."Z")
    if params[:letter]
      @courses = @courses.where('Name LIKE ?', params[:letter] + "%")
    end
    
  end




  def show
    @course = Course.find(params[:id])
    @chapters = @course.chapters
    @user_courses = current_user.courses

    @user_student = User.joins(:courses).where(:user_courses => {:user_id => current_user.id, :user_type => "student"})[0]

    @user_teacher = User.joins(:courses).where(:user_courses => {:user_id => current_user.id, :user_type => "teacher"})[0]

    p "++++++++++++++++++++++++"
     p @user_students

  
  end


  def new

  end

  def create
    @new_course = Course.create(:name => params[:name])
    flash[:success] = "Your new course has been added"
    redirect_to "/courses/#{@new_course.id}"


    # @course = Course.new(blah => blah)
    # if @course.save
    #   flash[:success] = "Yay!"
    # else
    #   flash[:warning] = "ruh-roh!"
    # end

  end

end

