require 'pry'

class DiceRateCalculator
  attr_reader :dices_count, :sides_count, :sum_combinations

  def initialize(dices_count, sides_count)
    @dices_count = dices_count
    @sides_count = sides_count
  end

  def calculate(number)
    initial_counts = Array.new(sides_count) { 1 }
    count = combinations_count(initial_counts, 2, number)
    puts count
    count / (sides_count ** dices_count).to_f
  end

  private
  def combinations_count(previous_counts, dice, number)
    current_counts = []
    middle_value = (dice*sides_count - dice)/2 + dice

    (dice..middle_value ).each_with_index do |value, index|
      start_index = (index+1 - sides_count < 0) ? 0 : index+1 - sides_count
      current_counts << previous_counts[start_index..index].inject(:+)
      return current_counts[index] if (value == number && dice == dices_count)
    end

    if dice == dices_count
      index = dice.even? ? (middle_value-number-1) : (middle_value-number)
      current_counts[index]
    else
      reversed_counts = dice.even? ? current_counts[0...-1].reverse : current_counts.reverse
      combinations_count(current_counts + reversed_counts, dice+1, number)
    end
  end
end
