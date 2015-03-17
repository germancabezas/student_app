class CoursesController < ApplicationController

  def index
    @courses = Course.all
    if params[:search]
      @courses = @courses.where('Name LIKE ?', "%" + params[:search] + "%")
    end
    
  end

  def show
    @course = Course.find(params[:id])
    @chapters = @course.chapters


  end

  def new

  end

  def create
    Course.create(:name => params[:name])
    flash[:success] = "Product has been added"
    redirect_to '/courses' 

  end

end

