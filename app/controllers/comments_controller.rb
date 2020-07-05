class CommentsController < ApplicationController
  before_action :authenticate_player!
  def comment
    @court = Court.find(params[:court_id])
    @comment = Comment.new
    @comments = @court.comments.order("id DESC")
  end

  def create
    @court = Court.find(params[:court_id])
    @comments = @court.comments.order("id DESC")
    @comment = @court.comments.new(comment_params)
    @comment.player_id = current_player.id
    if @comment.save
      @success = "コメントが保存されました"
      @comment = @court.comments.new
    else
      @warning = "コメントを入力してください"
    end
  end

  def destroy
    @comment = Comment.find(params[:court_id])
    @court = @comment.court
    @comments = @court.comments.order("id DESC")

    # ボタンプッシュ後
    redirect_to request.referer if @comment.player != current_player
    @comment.destroy
    @success = "コメントが削除されました"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment,:score)
  end
end
