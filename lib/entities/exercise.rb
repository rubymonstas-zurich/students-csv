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
