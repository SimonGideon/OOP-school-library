require './person'
require './module/classroom'

class Student < Person
  attr_accessor :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unkown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # rubocop:enable Style/OptionalBooleanParameter
  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
