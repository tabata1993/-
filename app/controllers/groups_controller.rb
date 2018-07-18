class GroupsController < ApplicationController

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

end
