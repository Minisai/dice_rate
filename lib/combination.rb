class Combination
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def permutations_count
    @permutations_count ||= (1..@numbers.count).inject(:*) / numbers_count.values.map { |value| (1..value).inject(:*) }.inject(:*)
  end

  private
  def numbers_count
    @numbers_count ||= numbers.inject(Hash.new(0)) do |hash, value|
      hash[value] += 1
      hash
    end
  end
end
