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
      customer_id = take_customer
      # p "Popped customer. Customer id : #{customer_id}"
      time_spent = Random.rand((1 * 60)..(2.5 * 60))
      @free_at = current_time + time_spent
      # p "Counter ##{@id} takes a new customer at #{formatted_current_time current_time}. Current queue size: #{@queue.size}"
      {
        customer: customer_id,
        time_spent: time_spent
      }
    end
  end

  def take_customer
    @queue.deq
  end
end
