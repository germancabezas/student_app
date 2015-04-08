class LessonElementsController < ApplicationController

  def show
    @lesson_elements = LessonElement.where(lesson_id: params[:id])
  end

end
