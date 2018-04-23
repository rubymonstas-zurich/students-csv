require_relative 'lib/loader'

exercises = load_exercises

# Exercise 4)

exercises.sort_by(&:percentage_achieved).reverse[0...50].each do |exercise|
  puts exercise.to_s
end

group_by_student = exercises.group_by(&:student)

exercise_count = {}

group_by_student.each_pair do |student, exercises|
  exercise_count[student] = exercises.size
end

exercise_count.sort_by do |student, exercise_count|
  exercise_count
end.reverse.each do |student, count|
  puts "#{student.to_s}: #{count}"
end
