class CommentsController < ApplicationController
  def create
    @court = Court.find(params[:court_id])
    @comment = @court.comments.new(comment_params)
    @comment.player_id = current_player.id
    @comments = @court.comments.order("id DESC")
    if @comment.save
      @success = "コメントが保存されました"
    else
      @comments = Comment.where(id: @court)
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
    params.require(:comment).permit(:comment)
  end
end
