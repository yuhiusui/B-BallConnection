module ApplicationHelper
  def current_player?(player)
    player == current_player
  end

  def negative_comment?(comment)
    if comment&.score < -0.5
      "#{comment&.score}"
    end
  end

  def negative_review?(review)
    if review&.score >= 0.25
      "#{review&.score}⭕️"
    elsif review&.score >= -0.25
      "#{review&.score}🔺"
    elsif review&.score < -0.25
      "#{review&.score}❌"
    end
  end
end
