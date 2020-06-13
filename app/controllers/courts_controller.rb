class CourtsController < ApplicationController
  # before_action :authenticate_player!
  def index
    @courts = Court.all.page(params[:page]).reverse_order.per(10)
    @like = Like.new
  end

  def new
    @court = Court.new
  end

  def edit
    @court = Court.find(params[:id])
  end

  def show
    @court = Court.find(params[:id])
    @comment = Comment.new
    @comments = @court.comments.order("id DESC")
  end

  def create
    @court = Court.new(court_params)
    if @court.save
      redirect_to courts_path
    else
      render :new
    end
  end

  def update
    @court = Court.find(params[:id])
    if @court.update(court_params)
      redirect_to courts_path
    else
      render :edit
    end
  end

  private

  def  court_params
    params.require(:court).permit(:court_image,:name, :number, :floor, :fee, :station,
                                  :url, :available_time, :station, :city, :parking,
                                  :is_valid, :other)
  end

end
