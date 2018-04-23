require 'minitest/autorun'

require_relative '../../lib/entities/lecture'

class LectureTest < Minitest::Test
  def test_to_s
    lecture = Lecture.new(1, 'Rubymonstas', 'undergraduate')
    assert_equal('Lecture(1): Rubymonstas [undergraduate]', lecture.to_s)
  end
end
