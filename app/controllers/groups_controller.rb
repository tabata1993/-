class GroupsController < ApplicationController
  before_action :login_sender,only:[:confirm,:index,:create,:new,:edit,:update,:destroy]

  def index
    @groups = Group.all
  end

  def new
    if params[:back]
      @group = Group.new(group_params)
    else
      @group = Group.new
    end
  end

  def confirm
    @group = Group.new(group_params)
    render :new if @group.invalid?
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render new_group_path
    end
  end



private
  def group_params
    params.require(:group).permit(:name,:user_id,:place,:time,:content)
  end

  def login_sender
    if logged_in?
    else
      redirect_to new_session_path,notice:"シュミティアを使うにはログインしてください"
    end
  end

end
