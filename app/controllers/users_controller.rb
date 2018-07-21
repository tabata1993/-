class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:pass_edit,:update]
  before_action :other_users_edit_block,only:[:edit,:pass_edit]

  def show
    @join_groups = @user.join_groups
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

  def edit
  end

  def pass_edit
  end

  def update
      if @user.update(user_params)
        redirect_to user_path(params[:id]),notice:"情報を変更しました！"
      else
        if params[:pass_edit]
          render 'pass_edit'
        else
          render 'edit'
        end
      end
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:sex,:age,:introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def other_users_edit_block
    unless current_user.id == @user.id
      redirect_to user_path(params[:id]),notice:"他人のユーザー情報は変更できません。"
    end
  end

end
