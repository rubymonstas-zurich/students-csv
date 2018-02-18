class Student

  attr_accessor :id, :full_name
  attr_reader :exercises

  def initialize(id, full_name)
    @id = id
    @full_name = full_name
    @exercises = []
  end

  def add_exercise(exercise)
    @exercises << exercise
  end

  def to_s
    "Student(#{id}): #{full_name}"
  end

end

class Lecture
  attr_accessor :id, :title, :level

  def initialize(id, title, level)
    @id = id
    @title = title
    @level = level
  end

  def to_s
    "Lecture(#{id}): #{title} [#{level}]"
  end
end

class Exercise
  attr_accessor :student, :lecture, :exercise_name, :percentage_achieved

  def initialize(student, lecture, exercise_name, percentage_achieved)
    @student = student
    @lecture = lecture
    @exercise_name = exercise_name
    @percentage_achieved = percentage_achieved
  end

  def to_s
    "Exercise, student: #{student.full_name}, #{lecture.title}, #{exercise_name}, #{percentage_achieved}"
  end
end


# Exercise 1)

students_csv_content = File.read("students.csv")
lines = students_csv_content.split("\n")

students = []

lines[1..-1].each do |line|
  row = line.split(",")
  student = Student.new(row[0], row[1])
  students << student
end

students.each do |student|
  puts student.to_s
end

# Exercise 2)

lectures_csv_content = File.read("lectures.csv")
lines = lectures_csv_content.split("\n")

lectures = []

lines[1..-1].each do |line|
  row = line.split(",")
  lecture = Lecture.new(row[0], row[1], row[2])
  lectures << lecture
end

lectures.each do |lecture|
  puts lecture.to_s
end

# Exercise 3)

exercises_csv_content = File.read("exercises.csv")
lines = exercises_csv_content.split("\n")

exercises = []

lines[1..-1].each do |line|
  row = line.split(",")
  student = students.find { |s| s.id == row[0] }
  lecture = lectures.find { |l| l.id == row[1] }
  exercise = Exercise.new(student, lecture, row[2], row[3])
  exercises << exercise
end

exercises.each do |exercise|
  puts exercise.to_s
end

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

# Exercise 5)

group_by_lecture = exercises.group_by(&:lecture)

lecture_average = {}

group_by_lecture.each_pair do |lecture, exercises|
  lecture_average[lecture] = exercises.map { |e|
    e.percentage_achieved.to_f
  }.reduce(:+) / exercises.length.to_f
end

lecture_average.sort_by do |lecture, average|
  average
end.reverse.each do |lecture, average|
  puts "#{lecture.title}: #{average}"
end
