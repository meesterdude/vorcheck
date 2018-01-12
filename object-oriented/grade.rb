class Grade

  GRADES = ['A++', 'A+', "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "D-", "F+", "F", "F-"]

  attr_reader :value

  def initialize(grade)
    @value = grade.upcase
    raise 'invalid grade' unless GRADES.include?(@value)
  end

   def <=>(other)
    lookup(other.value) <=> lookup(value)
  end

  def ==(other)
    lookup(value) == lookup(other.value)
  end

  def >(other)
    lookup(value) > lookup(other.value)
  end

  def <(other)
    lookup(value) < lookup(other.value)
  end

  def failure?
    self < self.class.new("C-")
  end


  def inspect
    value
  end

  private

  def lookup(value)
    GRADES.reverse.index(value)
  end

end
