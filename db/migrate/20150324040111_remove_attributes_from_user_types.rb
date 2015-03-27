class RemoveAttributesFromUserTypes < ActiveRecord::Migration
  def change
    remove_column :user_types, :teacher_type, :integer
    remove_column :user_types, :student_type, :integer
    add_column :user_types, :user_type, :string 
  end
end
