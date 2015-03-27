class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end

  def create

  end


  def update
    @user = User.find(params[:id])
    @user.update(:profile_image => params[:user][:profile_image])
    flash[:success] = "image has been updated"
    redirect_to "/users/#{@user.id}"
  end 



end
