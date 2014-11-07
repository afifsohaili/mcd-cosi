class Restaurant
  HOURS = 18
  MINUTES = 60

  def initialize
    @elapsed = Array.new(HOURS * MINUTES)
  end
end
