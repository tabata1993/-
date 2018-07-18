class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render new_user_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:sex,:age,:introduction)
  end

end
