require_relative 'lib/loader'

# Exercise 3)

exercises = load_exercises

exercises.each do |exercise|
  puts exercise.to_s
end
