class ChaptersController < ApplicationController

  def new
  end

  def create
    @new_chapter = Chapter.create(:name => params[:name], :description => params[:description], :course_id => params[:course_id])
    flash[:success] = "New Chapter added "
    redirect_to "/teachercourses/#{params[:course_id]}"

  end

end


