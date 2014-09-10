module MovesHelper
  def create_title(move)
    if move.mediums.count == 1 && move.mediums.first.present?
      title = signature(move.mediums.first) + ": " + move.title
    else
      title = move.title
    end
    return title
  end


  def get_move_icon(move)
    if move.tomatoes.present? && move.tomatoes.count == 1
      tomato = move.tomatoes.first
      path = tomato_icon_path(tomato)
    elsif move.move_type.make_my_day
      path = "todo_today.gif"
    elsif move.move_type.make_my_sprint
      path = "sprint.gif"
    elsif move.move_type.is_user_story
      path = "user_story.png"
    elsif move.move_type.has_twitter_idea
      path = "idea.png"
    elsif move.move_type.has_media
      path = "song.png"
    else
      path = "bewerten.png"
    end

    return path
  end

end
