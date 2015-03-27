class UserType < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_course

  def teacher
    user_type = "teacher"

  end

end
