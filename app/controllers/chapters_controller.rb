class ChaptersController < ApplicationController

  def new
    @course = Course.find(params[:id])
  end

  def create
    @new_chapter = Chapter.create(:name => params[:name], :course_id => params[:course_id])
    flash[:success] = "New Chapter added "
    redirect_to "/teachercourses/#{params[:course_id]}"

  end

end


