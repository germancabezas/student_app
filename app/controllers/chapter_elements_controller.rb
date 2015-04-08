class ChapterElementsController < ApplicationController

  def show
    @chapter_elements = LessonElement.where(chapter_id: params[:id])
  end

end
