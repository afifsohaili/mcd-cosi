class Cosi < Restaurant
  include TimeFormatter

  def initialize
    super
    @customers = Array.new
    @queue = Array.new
    @counters = Array.new
    (1..3).each do |id|
      @counters << Counter.new(id, @queue)
    end
  end

  def start
    0.upto(@seconds) do |second|
      @current_time = second
      if (@current_time % 60 == 0 && is_open?)
        receive_customers
      end
      serve_customer
    end
  end

  private

  def is_open?
    @seconds - @current_time > 5 * MINUTES
  end

  def receive_customers
    customers = Random.rand(0..3)
    add_customers(customers)
  end

  def add_customers(num)
    p "#{num} customers arrived at #{formatted_current_time @current_time}"
    num.times do
      add_customer
    end
    p "Customer in queue: #{@queue.size}"
  end

  def add_customer
    @queue.push(1)
    @customers.push(1)
  end

  def serve_customer
    @counters.each do |counter|
      counter.serve_customer @current_time
    end
  end
end

class Counter
  include TimeFormatter
  def initialize(id, queue)
    @id = id
    @free_at = 0
    @queue = queue
  end

  def free?(current_time)
    current_time > @free_at
  end

  def serve_customer(current_time)
    if free?(current_time) && @queue.size > 0
      take_customer
      time_spent = Random.rand((1 * 60)..(2.5 * 60))
      @free_at = current_time + time_spent
      p "Counter ##{@id} takes a new customer at #{formatted_current_time current_time}. Current queue size: #{@queue.size}"
    end
  end

  def take_customer
    @queue.pop
  end
end
