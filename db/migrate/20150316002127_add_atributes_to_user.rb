class AddAtributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :string
    add_column :users, :profile_image, :string

  end
end
