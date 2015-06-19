require_relative 'lib/dice_rate_calculator'
require 'method_profiler'

dice_count = 15
sides_count = 6
number = 100

profiler = MethodProfiler.observe(DiceRateCalculator)
result = DiceRateCalculator.new(dice_count, sides_count).calculate(number)

puts result
puts profiler.report
