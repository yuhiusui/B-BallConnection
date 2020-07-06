module ApplicationHelper
  def current_player?(player)
    player == current_player
  end


  # (仮)レビュー機能へのスコアリング
  # def negative_review?(review)
  #   if review&.score >= 0.25
  #     "#{review&.score}⭕️"
  #   elsif review&.score >= -0.25
  #     "#{review&.score}🔺"
  #   elsif review&.score < -0.25
  #     "#{review&.score}❌"
  #   end
  # end
end
