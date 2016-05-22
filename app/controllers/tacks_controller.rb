class TacksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @tack = current_user.pins.build
  end

  def create
    @tack = current_user.tacks.build(tack_params)
    if tack.save
      redirect_to @tack, notice: 'You added a Tack!'
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
  end

  def destroy
  end

  def update
  end

  private
  def correct_user
    @pin = current_user.pins.find_by(id: params[:id])
    redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
  end 

end
