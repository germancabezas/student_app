class LessonElement < ActiveRecord::Base

  belongs_to :lesson
  belongs_to :chapter

  mount_uploader :url, UserPhotoUploader

end
