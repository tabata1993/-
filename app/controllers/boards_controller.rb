class BoardsController < ApplicationController
  before_action :login_check

  def show
    @group = Group.find_by(id: params[:id])
    @join = current_user.joins.find_by(group_id: @group.id)
    @boards = @group.boards
    @board = Board.new
    @board.group_id = @group.id
    @board.user_id = current_user.id
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board.group_id),notice:"投稿しました！"
    else
      redirect_to board_path(@board.group_id),notice:"1~140字で内容を書き込んでください！"
    end
  end

  def update
    @board = Board.find(params[:id])
    @board.remove_image!
    if @board.user == current_user || @board.group.user_id == current_user.id
      @board.update(content:"書き込みは削除されました。", image: "nil")
      redirect_to board_path(@board.group_id),notice:"投稿内容を削除しました！"
    else
      redirect_to board_path(@board.group_id),notice:"書き込みの削除は投稿者かサークル代表者しかできません"
    end
  end

private
  def board_params
    params.require(:board).permit(:group_id,:user_id,:content,:image,:remove_iamge)
  end

end
