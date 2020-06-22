class RelationsController < ApplicationController
  before_action :authenticate_player!
  def create
    current_player.follow(params[:player_id])
    redirect_to request.referer
  end

  def destroy
    current_player.unfollow(params[:player_id])
    redirect_to request.referer
  end

  def following
    player = Player.find(params[:player_id])
    @players = player.following_player.page(params[:page]).reverse_order.per(7)
  end

  def followed
    player = Player.find(params[:player_id])
    @players = player.follower_player.page(params[:page]).reverse_order.per(7)
  end
end
