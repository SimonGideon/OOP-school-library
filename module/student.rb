require './person'
require './module/classroom'

class Student < Person
  attr_reader :classroom

  def initialize(classroom ,age, name='Unkown', parent_permission=true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
