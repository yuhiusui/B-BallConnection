class ReviewsController < ApplicationController
  def create
    @court = Court.find(params[:court_id])
    @new_review = Court.new
    @review = @court.reviews.new(review_params)
    @review.player_id = current_player.id
    if @review.save
      flash[:success] = "Review was successfully created."
      # redirect_to court_path(@court)
    else
      @reviews = Review.where(id: @court)
      # redirect_to court_path(@court)
    end
  end

  def destroy
    @review = Review.find(params[:court_id])
    @court = @review.court
    if @review.player != current_player
      redirect_to request.referer
    end
    @review.destroy
    # redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:rv_title, :rv_body, :rate, :rv_image)
  end
end
