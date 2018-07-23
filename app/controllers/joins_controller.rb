class JoinsController < ApplicationController

  def create
    @join = current_user.joins.create(group_id: params[:group_id])
    @group = Group.find_by(id: @join.group_id)
    @manager_user = @group.user
    @member_user = current_user
    JoinMailer.join_mail(@group,@manager_user,@member_user).deliver
    redirect_to group_path(params[:group_id]), notice: "サークルに参加しました。"
  end

  def destroy
    join = current_user.joins.find_by(group_id: params[:id]).destroy
    redirect_to groups_path, notice: "退会しました。"
  end

end
