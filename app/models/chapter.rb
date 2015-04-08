class Chapter < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  has_many :lesson_elements
end
