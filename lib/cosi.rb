class Cosi < Restaurant
  include TimeFormatter

  def initialize
    super
    @customers = Array.new
    @queue = Queue.new
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
        # p @customers
        # p @queue
      end
      serve_customer
    end
    # p @customers
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
    # p "#{num} customers arrived at #{formatted_current_time @current_time}"
    num.times do
      add_customer
    end
    # p "Customer in queue: #{@queue.size}"
  end

  def add_customer
    @customers.push(@current_time)
    @queue.push(@customers.size - 1)
  end

  def serve_customer
    @counters.each do |counter|
      data = counter.serve_customer @current_time
      unless data.nil?
        cid = data[:customer].to_i
        @customers[cid] = @current_time - @customers[cid] + data[:time_spent]
      end
    end
  end
end
