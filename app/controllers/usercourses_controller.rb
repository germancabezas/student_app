class UsercoursesController < ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
  @user_courses = current_user.courses
  end


  def show


  end
end

