class LessonElement < ActiveRecord::Base

  belongs_to :lesson
  belongs_to :chapter

end
