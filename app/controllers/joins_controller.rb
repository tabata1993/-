class JoinsController < ApplicationController

  def create
    join = current_user.joins.create(group_id: params[:group_id])
    redirect_to group_path(params[:group_id]), notice: "サークルに参加しました。"
  end

  def when_new_group_create
  end

  def destroy
    join = current_user.joins.find_by(group_id: params[:id]).destroy
    redirect_to groups_path, notice: "退会しました。"
  end

end