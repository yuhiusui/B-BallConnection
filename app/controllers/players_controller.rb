class PlayersController < ApplicationController
  before_action :authenticate_player!
  before_action :ensure_current_player?, only: [:edit, :update]

  def index
    @players = Player.all.page(params[:page]).reverse_order.per(10)
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end


  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to player_path(@player), notice: "会員情報の編集に成功しました。"
    else
      render :edit
    end
  end

  def leave
    @player = current_player
  end

  def update_status
    @player = current_player
    @player.update(player_params)
    reset_session
    redirect_to root_path
  end

  private
  def player_params
    params.require(:player).permit(:name, :email, :intro, :player_image,
                                   :position,:history, :skill, :is_valid,
                                   :twitter, :fadebook, :instagram)
  end
  def ensure_current_player?
    player = Player.find(params[:id])
    redirect_to player_path(current_player) unless player == current_player
  end


end
