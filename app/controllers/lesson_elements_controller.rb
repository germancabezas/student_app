class LessonElementsController < ApplicationController

  def show
    @lesson_elements = LessonElement.where(lesson_id: params[:id])
  end

  def save

    @new_lesson_element = LessonElement.create(:element_type => params[:element_type], :text => params[:element_text], :lesson_id => params[:lesson_id], :chapter_id => params[:chapter_id], :url => params[:file], :priority => params[:element_priority])
    @new_lesson_element.save
    p params
  end
end

