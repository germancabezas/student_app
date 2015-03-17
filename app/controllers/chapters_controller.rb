class ChaptersController < ApplicationController

  def new
  end

  def create
    @chapter = Chapter.create(:name => params[:name], :description => params[:description], :course_id => params[:course_id])
    @chapter.save
    redirect_to '/courses'

  end

end


