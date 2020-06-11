class LikesController < ApplicationController
  def create
    @like = current_player.likes.create(court_id: params[:court_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(court_id: params[:court_id], player_id: current_player.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
