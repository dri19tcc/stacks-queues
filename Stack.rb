# (LIFO)
class Stack
  attr_reader :store
  def initialize
    @store = Array.new
  end

  def pop
    @store.pop
  end

  def push(element)
    @store << element
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end
