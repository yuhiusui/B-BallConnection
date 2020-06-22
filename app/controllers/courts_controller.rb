class CourtsController < ApplicationController
  before_action :authenticate_player!
  before_action :ensure_admin_player?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @like = Like.new
    if params[:q].nil?
      @q = Court.ransack(params[:q])
    else
      prefecture_code = JpPrefecture::Prefecture.find(name: params[:q][:prefecture_code_eq]).try(:code)
      @q = Court.ransack({
        prefecture_code_eq: prefecture_code,
        name_cont: params[:q][:name_cont],
      })
    end
    @courts = @q.result(distinct: true).page(params[:page]).reverse_order.per(10)
    @q = Court.ransack()
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
  end
  def review
    @court = Court.find(params[:court_id])
    @review = Review.new
    @reviews = @court.reviews.order("id DESC")
  end
  def comment
    @court = Court.find(params[:court_id])
    @comment = Comment.new
    @comments = @court.comments.order("id DESC")
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

  def ensure_admin_player?
    redirect_to player_path(current_player) unless current_player.admin?
  end
end
