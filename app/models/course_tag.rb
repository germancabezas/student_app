class CourseTag < ActiveRecord::Base
  
  belongs_to :course
  belongs_to :tag

end
