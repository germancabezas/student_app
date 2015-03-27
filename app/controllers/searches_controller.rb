class SearchesController < ApplicationController

  def index

    cookies[:keyword] ||= ""
    # The above code is just a short cut of saying
    # x = x + 2
    # x += 2
    # cookies[:keyword] = cookies[:keyword] || ""
    cookies[:keyword] += " " + params[:tag] if params[:tag].present?
    @keywords = []
    @keywords = cookies[:keyword].split(" ")
    # cookies[@keywords]


    if params[:tag].present?
      @tag = Tag.find_by(:name => params[:tag])
      if @tag.nil?
       @keywords << @tag
      else
        @courses = @tag.courses
      end
    else
      @courses = Course.all
    end
  end


end





# if params[:tag].present?
#   @tag = Tag.find_by(:name => params[:tag])
#   if @tag.nil?
#     @courses = Course.all
#   else
#     @courses = @tag.courses
#   end








# cookies[:keyword] = [1,2,3,4,5]
#  @keywords = "#{cookies[:keyword_array]}"
#  @keywords_search = @keywords.split("&")



  # tag.nil? ? @courses = @tag.courses : @courses = Course.all

  # true ? "truthy statement" : "falsey statement"