class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Court.ransack(params[:q]) # ransackメソッド推奨
    @search_courts = @search.result.page(params[:page])
  end

  protected

  def after_sign_in_path_for(resource)
    player_path(current_player)
  end

  def after_sign_out_path_for(resource)
    new_player_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, :intro, :player_image,
      :position, :history, :skill, :is_valid,
    ])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :intro, :player_image,
      :position, :history, :skill, :is_valid,
    ])
  end
end
