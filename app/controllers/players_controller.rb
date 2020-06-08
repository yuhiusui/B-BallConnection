class PlayersController < ApplicationController
  # before_action :authenticate_player!
  def index
    @players = Player.all
    # @player = Player.page(params[:page]).reverse_order.per(10)
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def leave
    @player = Player.find(params[:id])
  end

  def update
    @player = current_player
    @player.update(player_params)
    redirect_to public_path, notice: "会員情報の編集に成功しました。"
  end

  def update_status
    @player = current_player
    @player.update(player_params)
    reset_session
    redirect_to root_path
  end

  private
  def player_params
    params.require(:player).permit(:name, :email, :intro, :player_image_id,
                                   :position,:history, :skill, :is_valid)
  end


end
