require_relative 'lib/loader'

exercises = load_exercises

# Exercise 5)

group_by_lecture = exercises.group_by(&:lecture)

lecture_average = {}

group_by_lecture.each_pair do |lecture, exercises|
  lecture_average[lecture] = exercises.map do |e|
    e.percentage_achieved.to_f
  end.reduce(:+) / exercises.length.to_f
end

lecture_average.sort_by do |lecture, average|
  average
end.reverse.each do |lecture, average|
  puts "#{lecture.title}: #{average}"
end
