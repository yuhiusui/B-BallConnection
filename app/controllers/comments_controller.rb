class CommentsController < ApplicationController
  def create
    @favorite = current_player.favorites.create
end
