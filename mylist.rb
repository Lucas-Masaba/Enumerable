require_relative 'myenumerable'

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

p list.all? { |e| e < 5 }
# => true
p list.all? { |e| e > 5 }
# => false
p list.any? { |e| e == 2 }
# => true
p list.any? { |e| e == 5 }
# => false
p list.filter(&:even?)
# => [2, 4]
