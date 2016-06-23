class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to user_path(current_user.username), notice: 'New Board was created!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: 'The Board was updated!'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: 'The Board was deleted!'
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def correct_user
    @board = current_user.boards.find_by(id: params[:id])
    redirect_to boards_path, notice: "Not authorized to edit this Board" if @board.nil?
  end

  def board_params
    params.require(:board).permit(:name)
  end

end
