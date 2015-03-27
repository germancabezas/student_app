class ChangeUserTypeToNone < ActiveRecord::Migration
  def change
    remove_column :users, :user_type_id, :integer
  end
end
