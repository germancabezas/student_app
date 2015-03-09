class Course < ActiveRecord::Base

  belongs_to :user
  has_many :usercourses
  has_many :users, :through => :user_courses
  has_many :chapters
end
