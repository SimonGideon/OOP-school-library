require "./person"
require "./module/classroom"

class Student < Person
  attr_accessor :classroom
  attr_reader :parent_permission

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = "Unkown", parent_permission = true, id = nil)
    super(age, name, parent_permission, id)
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

  def to_hash
    {
      id: id,
      age: age,
      name: name,
      parent_permission: parent_permission,
    }
  end
end
