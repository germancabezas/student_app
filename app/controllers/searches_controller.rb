class SearchesController < ApplicationController

  def index
    if params[:tag].present?
    @tag = Tag.find_by(:name => params[:tag])
    @courses = @tag.courses
    else
    @courses = Course.all
    end
  end


end

