class TacksController < ApplicationController
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
    @tack = Tack.find(params[:id])
  end

  def show
    @tack = Tack.find(params[:id])
  end

  def destroy
    @tack = Tack.find(params[:id])
    @tack.destroy
    redirect_to tacks_path, notice: 'You deleted a Tack!'
  end

  def update
    @tack = Tack.find(params[:id])
    if @tack.update(tack_params)
      redirect_to(tack_path(@tack))
    else
      render 'edit'
    end
  end

  def repost
    @tack = Tack.find(params[:id])
    @tack.repost(current_user)
    redirect_to tack_path
  end

  private
  def correct_user
    @tack = current_user.tacks.find_by(id: params[:id])
    redirect_to tacks_path, notice: "Not authorized to edit this Tack" if @tack.nil?
  end

  def tack_params
    params.require(:tack).permit(:description, :tack_image)
  end

end
