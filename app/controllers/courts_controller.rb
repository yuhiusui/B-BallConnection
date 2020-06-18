class CourtsController < ApplicationController
  # before_action :authenticate_player!
  def index
    @courts = Court.page(params[:page]).reverse_order.per(8)
    @like = Like.new
  end

  def new
    @court = Court.new
  end
  def create
    @court = Court.new(court_params)
    if @court.save
      redirect_to courts_path
    else
      render :new
    end
  end


  def show
    @court = Court.find(params[:id])
    @comment = Comment.new
    @comments = @court.comments.order("id DESC")
  end
  def review
    @court = Court.find(params[:court_id])
    @review = Review.new
    @reviews = @court.reviews.order("id DESC")
  end


  def edit
    @court = Court.find(params[:id])
  end
  def update
    @court = Court.find(params[:id])
    if @court.update(court_params)
      redirect_to courts_path
    else
      render :edit
    end
  end

  def destroy
    @court = Court.find(params[:id])
    @court.destroy
    redirect_to courts_path
  end

  private

  def  court_params
    params.require(:court).permit(:court_image,:name, :number, :floor, :fee, :station,
                                  :url, :available_time, :station, :parking, :postal_code,
                                  :prefecture_code, :city, :street, :address,
                                  :is_valid, :other)
  end

end
