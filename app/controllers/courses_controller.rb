class CoursesController < ApplicationController

  def index
    @courses = Course.all
    
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

