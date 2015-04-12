class CoursesController < ApplicationController

  def index
    @courses = Course.paginate(:page => params[:page], :per_page => 6).where(:public => 1)
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
    if current_user
      @user_courses = current_user.courses
      @user_student = User.joins(:courses).where(:user_courses => {:user_id => current_user.id, :user_type => "student"})[0]

      @user_teacher = User.joins(:courses).where(:user_courses => {:user_id => current_user.id, :user_type => "teacher"})[0]
    end


    @authors_array = User.joins(:courses).where(:user_courses => {:user_type => "teacher", :course_id => params[:id]})
    p " ========================== "
    p @authors_array

    # @array = Course.joins(:users).where(:user_courses => {:user_id => current_user.id, :user_type => "student", :course_id => params[:id]})
  
  end

  def publish
    @course = Course.find(params[:course_id])
    @course.update(:public => 1)
    flash[:success] = "Your Course is Now Public"
    redirect_to "/teachercourses/#{@course.id}"
  end


  def new
    @course = Course.new


  end

  def create

    @new_course = Course.create(:name => params[:name], :description => params[:description], :image => params[:image])
    @new_user_course = UserCourse.create(:user_id => current_user.id, :course_id => "#{@new_course.id}", :user_type => "teacher")
    flash[:success] = "Your new course has been added"
    redirect_to "/teachercourses/#{@new_course.id}"

  end

end

