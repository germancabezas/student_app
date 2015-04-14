class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all 
  end
  def show
    @course = Course.find(params[:id])
    @lesson = Lesson.find(params[:id])  
  end
  def new
    @course = Course.find(params[:id])
    @chapter = Chapter.find(params[:chapter_id])
  end
  def create
    @course = Course.find(params[:id])
    @new_lesson = Lesson.create(:name => params[:name], :chapter_id => params[:chapter_id])
    flash[:success] = "New Lesson added "
    redirect_to "/teachercourses/#{@course.id}"

  end
end
