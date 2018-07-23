class JoinsController < ApplicationController
  before_action :login_check
  
  def create
    join = current_user.joins.create(group_id: params[:group_id])
    @group = join.group
    @manager_user = @group.user
    @member_user = current_user
    JoinMailer.join_mail(@group,@manager_user,@member_user).deliver
    redirect_to board_path(params[:group_id]), notice: "サークルに参加しました!掲示板で報告しましょう！"
  end

  def destroy
    join = current_user.joins.find_by(group_id: params[:id]).destroy
    redirect_to groups_path, notice: "退会しました。"
  end

end
