require_relative 'entities/student'
require_relative 'entities/lecture'
require_relative 'entities/exercise'

def load_students
  lines = File.read("students.csv").split("\n")

  lines[1..-1].map do |line|
    row = line.split(",")
    Student.new(row[0], row[1])
  end
end

def load_lectures
  lines = File.read("lectures.csv").split("\n")

  lines[1..-1].map do |line|
    row = line.split(",")
    Lecture.new(row[0], row[1], row[2])
  end
end

def load_exercises
  students = load_students
  lectures = load_lectures

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

  exercises
end
