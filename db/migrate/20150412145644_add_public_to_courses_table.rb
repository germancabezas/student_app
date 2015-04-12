class AddPublicToCoursesTable < ActiveRecord::Migration
  def change
    add_column :courses, :public, :integer
  end
end
  