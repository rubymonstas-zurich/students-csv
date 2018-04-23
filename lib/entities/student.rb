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
