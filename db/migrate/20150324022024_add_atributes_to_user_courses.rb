class AddAtributesToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :user_type, :integer
  end
end
