class LikesController < ApplicationController
  before_action :authenticate_player!
  def liked_courts
    @player = Player.find(params[:player_id])
    @courts = @player.liked_courts.page(params[:page]).reverse_order.per(10)
  end

  def liked_players
    @court = Court.find(params[:court_id])
    @players = @court.liked_players.page(params[:page]).reverse_order.per(10)
  end

  def create
    @like = current_player.likes.create(court_id: params[:court_id])
    @court = Court.find(params[:court_id])
  end

  def destroy
    @like = Like.find_by(court_id: params[:court_id], player_id: current_player.id)
    @like.destroy
    @court = Court.find(params[:court_id])
  end
end
