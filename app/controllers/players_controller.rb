class PlayersController < ApplicationController
  before_action :authenticate_player!
  before_action :ensure_current_player?, only: [:destroy]
  before_action :ensure_admin_player?, only: [:admin_destroy]
  before_action :ensure_current_or_admin_player?, only: [:edit, :update]

  def index
    @players = Player.page(params[:page]).reverse_order.per(20)
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

  def destroy
    @player = Player.find(params[:id]).destroy
    flash[:success] = "退会しました"
    redirect_to root_path
  end

  def admin_destroy
    @player = Player.find(params[:player_id]).destroy
    flash[:success] = "プレイヤーを削除しました"
    redirect_to root_path
  end

  def update_status
    player = current_player
    player.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :intro, :player_image,
                                   :position, :history, :skill,
                                   :twitter, :fadebook, :instagram)
  end

  def ensure_current_player?
    player = Player.find(params[:id])
    redirect_to player_path(current_player) unless player == current_player
  end

  def ensure_admin_player?
    redirect_to player_path(current_player) unless current_player.admin?
  end

  # ユーザー情報管理を管理者側でも可能にするため
  def ensure_current_or_admin_player?
    player = Player.find(params[:id])
    redirect_to player_path(current_player) unless current_player.admin? || current_player.admin?
  end
end
