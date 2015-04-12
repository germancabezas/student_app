class LessonElementsController < ApplicationController

  def show
    @lesson_elements = LessonElement.where(lesson_id: params[:id])
  end

  def save

    @new_lesson_element = LessonElement.create(:element_type => params[:element_type], :text => params[:element_text], :lesson_id => params[:lesson_id], :chapter_id => params[:chapter_id], :url => params[:file])
    @new_lesson_element.save
    p params
    # respond_to do |format|
    #   format.json { head :ok }
    # end
  end
end






# JAY SAMPLE
# def create
#   @photo = Photo.new(url: params[:file], user_id: params[:user_id], name: "Change Name", description: "Change Description")
#   user = User.find_by(id: params[:user_id])
#   if user.vendor? && @photo.save
#     redirect_to root_path
#   end
# end