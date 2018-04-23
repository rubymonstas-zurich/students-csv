require_relative 'lib/loader'

# Exercise 2)

lectures = load_lectures

lectures.each do |lecture|
  puts lecture.to_s
end
