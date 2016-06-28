class TacksController < ApplicationController
  before_action :set_tack, only: [:show, :like, :repost, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @tacks = Tack.all
  end

  def new
    @tack = Tack.new
  end

  def create
    @tack = current_user.tacks.build(tack_params)
    if @tack.save
      redirect_to @tack, notice: 'You added a Tack!'
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @tack.destroy
    redirect_to tacks_path, notice: 'You deleted a Tack!'
  end

  def update
    if @tack.update(tack_params)
      redirect_to(tack_path(@tack))
    else
      render 'edit'
    end
  end

  def repost
    @tack.repost(tack_params, current_user)
    redirect_to root_url
  end

  def like
    @like = @tack.likes.build(user_id: current_user.id)
    if @like.save
      flash[:notice] = "You liked this Tack!"
      redirect_to tacks_path
    else
      flash[:notice] = "You already liked this Tack!"
      redirect_to tacks_path
    end
  end

  def show_repost
    @tack = Tack.find(params[:id])
  end

  def repost
    @tack.repost(tack_params, current_user)
    redirect_to root_url
  end

  private

  def set_tack
     @tack = Tack.find(params[:id])
  end

  def correct_user
    @tack = current_user.tacks.find_by(id: params[:id])
    redirect_to tacks_path, notice: "Not authorized to edit this Tack" if @tack.nil?
  end

  def tack_params
    params.require(:tack).permit(:description, :tack_image, :board_id)
  end

end
