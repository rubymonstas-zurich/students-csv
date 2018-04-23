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
