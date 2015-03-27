class ChangeCoursesUserIdnstructorId < ActiveRecord::Migration
  def change
    remove_column :courses, :user_id, :integer
    remove_column :courses, :instructor_id, :integer
  end
end
