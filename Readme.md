#McDonalds vs. Cosi

##Setup
```
git clone git@github.com:afifsohaili/mcd-cosi.git
bundle install --local
```
*Note: This project uses [require-all](https://github.com/jarmo/require_all) gem to autoload all files in `lib/` folder and all of its subdirectories*

To start program, run:
```
ruby main.rb
```
___
####Background

Hairy Fodder wants to open a fast food joint in Hogwarps, but he's not sure which type of serving line he should use in his restaurant:

1. McDonalds serving line:
```
C C C C   New customer queue up behind the lines with the shortest customer
o o o o   Counter only serves customers in its line
o o o o      o = customer
o o o ^      ^ = new customer
o   o        C = counter
```

2. Cosi serving line:
```
C C C C C   New customers queue behind one line
o o o o o   Next customer in line is served by any counter that is free first
    o       ---
    o       o = customer
    o       ^ = new customer
    o       C = counter
    ^
```

####Task
Hairy Fodder hires you to write a program that simulate both queues and measure the efficiency of both types of serving line.
He asks you to record the time every customer spent waiting in line and ultimately be served at the counter.
Then he asks you to calculate the average and the median of the time taken for each customer to get food.

*p.s. The cheapskate Hairy Fodder will pay you nothing for this, but you want to do it anyway because it sounds fun.*

####What to measure:
- The median time spent by a customer to get his food (starting from him waiting in line to him being served)
```
median = (array of time taken per customer)
         .sorted
         .select_element_at(number of customer / 2)
```
- The average time spent by a customer to get his food (starting from him waiting in line to him being served)
```
average = sum of (array of time taken per customer) / number of customer
```
Print a log showing the results of respective serving line type.

####Rules:
- Each tick represents a second
- There is only 4 counters open throughout the day for each restaurant
- There is a 25% chance that a customer will come in every 2 minutes
- A counter takes between 1 minute to 2.5 minutes to finish serving a customer

####Expected outcome of this project:
- Improve understanding of data structure (queue, array)
- Improve understanding of object-oriented programming concepts
- Improve logic and algorithm
- **Fun and satisfaction for completing the challenge**

####Hints
- Once a new customer comes up to the counter, randomly generate the time taken for him to be served and mark the tick at `current_tick + time_taken` to take a new customer

####Cheatsheet
```
# You will need this at least twice throughout the program
Random.rand(1..10) # This will generate a random number between 1 and 10.

# Different types of loops/iterators in Ruby:
0.step(10, 2) do |v|
  puts v
end # => 0, 2, 4, 6, 8

12.step(6, -2) do |iter|
  puts iter
end # => 12, 10, 8, 6

5.downto(3) do |j|
  puts j
end # => 5, 4, 3

3.upto(5) do |x|
  puts x
end # => 3, 4, 5

4.times do
  puts 1
end # => 1, 1, 1, 1

[1, 5, 9].each do |i|
  puts (i + 1)
end # => 2, 6, 10
```

___

####I'm done. What next?!
Try to:
- simulate McDonalds customers jumping from lines to the shortest line
- simulate the restaurants being extra busy for a small period of time (to simulate lunch hour)
- refactor the code. make it as clean as possible
- suggest Hairy Fodder to use the inefficient one instead of the efficient one
