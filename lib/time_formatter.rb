module TimeFormatter
  def formatted_current_time current_time
    "#{current_hour(current_time)}:#{current_minute(current_time)}:#{current_second(current_time)}"
  end

  def current_hour current_time
    current_time / (Restaurant.MINUTES * Restaurant.SECONDS)
  end

  def current_minute current_time
    (current_time / (Restaurant.SECONDS)) % Restaurant.MINUTES
  end

  def current_second current_time
    current_time % Restaurant.SECONDS
  end
end
