class NaturalLanguageApiController < ApplicationController
  def get_checked_comment
    score = Language.get_data(params[:comment])
    render json: score
  end
end