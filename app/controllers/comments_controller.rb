class CommentsController < ApplicationController
  def create
    @court = Court.find(params[:court_id])
    @new_comment = Court.new
    @comment = @court.comments.new(comment_params)
    @comment.player_id = current_player.id
    @comments = @court.comments.order("id DESC")
    if @comment.save
      flash[:success] = "Comment was successfully created."
      # redirect_to court_path(@court)
    else
      @comments = Comment.where(id: @court)
      # redirect_to court_path(@court)
    end
  end

  def destroy
    @comment = Comment.find(params[:court_id])
    @court = @comment.court
    @comments = @court.comments.order("id DESC")
    if @comment.player != current_player
      redirect_to request.referer
    end
    @comment.destroy
    # redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
