# user controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.notice = "User '#{@user.username}' Created!"
      redirect_to edit_user_path(@user)
    else
      flash.notice = "Error, creating '#{@user.username}'!"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.notice = "'#{@user.username}' was succesfully updated!"
      redirect_to new_user_path
    else
      flash.notice = "Error, updating '#{@user.username}'!"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    p @user
    if @user.destroy(user_params)
      flash.notice = "'#{@user.username}' was deleted!"
      redirect_to new_user_path
    else
      flash.notice = "Error, deleting '#{@user.username}'!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
