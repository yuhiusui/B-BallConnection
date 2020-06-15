class LikesController < ApplicationController
  def liked_courts
    # @players = Player.all.page(params[:page]).reverse_order.per(10)
    @player = Player.find(params[:player_id])
  end

  def liked_players
    # @courts = Court.all.page(params[:page]).reverse_order.per(10)
    @court = Court.find(params[:court_id])
  end

  def create
    @like = current_player.likes.create(court_id: params[:court_id])
    @court = Court.find(params[:court_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(court_id: params[:court_id], player_id: current_player.id)
    @like.destroy
    @court = Court.find(params[:court_id])
    # redirect_back(fallback_location: root_path)
  end
end
