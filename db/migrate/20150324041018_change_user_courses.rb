class ChangeUserCourses < ActiveRecord::Migration
  def change
    change_column :user_courses, :user_type, :string
  end
end
