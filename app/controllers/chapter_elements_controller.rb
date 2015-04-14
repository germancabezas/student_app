class ChapterElementsController < ApplicationController

  def show
    @chapter_elements = LessonElement.where(chapter_id: params[:id]).order(:priority)
  end

  def update
    @chapter_element = LessonElement.find(params[:id])
    @chapter_element.update(:priority => params[:element_priority])
  end

end
