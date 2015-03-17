class Course < ActiveRecord::Base

  belongs_to :user
  has_many :usercourses
  has_many :users, :through => :user_courses
  has_many :chapters


  has_many :course_tags
  has_many :tags, :through => :course_tags

end
