find_sum = ->(num) do
  Array(1..num).select { |num| num % 3 == 0 || num % 5 == 0 }
               .reduce(0) { |sum, num| sum + num }
end

puts "Answer is: #{find_sum.call(1000)}"
