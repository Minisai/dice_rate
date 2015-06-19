require_relative 'combination'
require 'pry'

class DiceRateCalculator
  attr_reader :dices_count, :sides_count, :sum_combinations

  def initialize(dices_count, sides_count)
    @dices_count = dices_count
    @sides_count = sides_count
  end

  def calculate(number)
    if sum_combinations.keys.include?(number)
      combinations_with_permutations_count = sum_combinations[number].inject(0) do |sum, combination|
        sum + Combination.new(combination).permutations_count
      end
      combinations_with_permutations_count.to_f / (sides_count ** dices_count).to_f
    end
  end

  private
  def sum_combinations
    @sum_combinations ||= (1..sides_count).to_a.repeated_combination(dices_count).group_by { |c| c.inject(:+)}
  end
end
