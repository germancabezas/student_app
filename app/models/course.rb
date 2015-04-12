class Course < ActiveRecord::Base

  has_many :user_courses
  has_many :users, :through => :user_courses
  has_many :chapters


  has_many :course_tags
  has_many :tags, :through => :course_tags

  mount_uploader :image, CourseImageUploader


end

