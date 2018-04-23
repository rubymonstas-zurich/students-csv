require_relative 'lib/loader'

# Exercise 1)

students = load_students

students.each do |student|
  puts student.to_s
end
