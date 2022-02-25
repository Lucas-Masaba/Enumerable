module MyEnumerable

  def all?(&block)
    result = true
    each do |element|
      result = false unless block.call(element)
    end
    result
  end

  def any?(&block)
    result = false
    each do |element|
      result = true if block.call(element)
    end
    result
  end

  def filter(&block)
    result = []
    each do |element|
      result << element if block.call(element)
    end
    result
  end
end