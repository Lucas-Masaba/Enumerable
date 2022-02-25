require_relative 'my_enumerable'

class MyList
  include MyEnumerable

  def initialize(*list)
    @list = list
  end

  def each
    @list.each { |e| yield e if block_given? }
  end
end

list = MyList.new(1, 2, 3, 4)

list.all? { |e| e < 5 }
# => true
list.all? { |e| e > 5 }
# => false
list.any? { |e| e == 2 }
# => true
list.any? { |e| e == 5 }
# => false
list.filter(&:even?)
# => [2, 4]
