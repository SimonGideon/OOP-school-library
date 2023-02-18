require './person'
class Teacher < Person
  attr_accessor :specialization

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name, specialization, parent_permission = true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  # rubocop:enable Style/OptionalBooleanParameter
  def can_use_services
    true
  end
end
