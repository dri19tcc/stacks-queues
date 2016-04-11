require './Stack.rb'
require './Queue.rb'

class Company
  COMPANY_SIZE = 6
  WAITING = 10
  attr_reader :hired, :unemployed

  def initialize
    @hired = Stack.new #used as a stack
    @unemployed = Queue.new # queue of peeps waiting for a job
    WAITING.times do |n|
      @unemployed.enqueue(n)
    end
  end

  def hire_up_to(number = 6)
    until @hired.size == number
      person = @unemployed.dequeue
      @hired.push(person)
    end
  end

  def die
    rand(1..6)
  end

  def downsize
    to_fire = die
    to_fire.times do
      fire
    end
  end

  def fire
    @unemployed.enqueue(@hired.pop)
  end

  def employees
    @hired.store
  end
end

x = Company.new
x.hire_up_to(Company::COMPANY_SIZE)
x.downsize
x.hire_up_to(Company::COMPANY_SIZE)
puts x.employees #this is to print out all of my @store


# class Company
#   attr_reader :hire_line, :job_list
#   def initialize
#     @hire_line = (7..10).to_a #people waiting to be hired (FIFO)
#     @job_list = (1..6).to_a #current employees to be fired (LIFO)
#   end
#
#   def die
#     rand(1..6)
#   end
#
#   def hire
#     until @job_list.length == 6
#       @job_list << @hire_line.shift
#     end
#     return @job_list
#   end
#
#   def fire
#     to_fire = die
#     to_fire.times do
#       @hire_line << @job_list.pop
#     end
#     return @hire_line
#   end
# end
