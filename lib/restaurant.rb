class Restaurant
  HOURS = 0.2
  MINUTES = 60
  SECONDS = 60

  def initialize
    @seconds = HOURS * MINUTES * SECONDS
  end

  def self.HOURS
    HOURS
  end
  def self.MINUTES
    MINUTES
  end
  def self.SECONDS
    SECONDS
  end
end
