class ReviewsController < ApplicationController
  def create
    @court = Court.find(params[:court_id])
    @review = @court.reviews.new(review_params)
    @review.player_id = current_player.id
    @reviews = @court.reviews.order("id DESC")
    if @review.save
      @success = "レビューが保存されました"
    else
      @warning = "必要箇所を記入してください"
    end
  end

  def destroy
    @review = Review.find(params[:court_id])
    @court = @review.court
    @reviews = @court.reviews.order("id DESC")
    # ボタンプッシュ後
    redirect_to request.referer if @review.player != current_player
    @review.destroy
    @success = "レビューが削除されました"
  end

  private

  def review_params
    params.require(:review).permit(:rv_title, :rv_body, :rate, :rv_image)
  end
end
