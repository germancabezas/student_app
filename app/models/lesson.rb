class Lesson < ActiveRecord::Base

  belongs_to :chapter
  has_many :lesson_elements

end
