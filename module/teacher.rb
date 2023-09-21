require "./person"

class Teacher < Person
  attr_accessor :specialization
  attr_reader :parent_permission

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = "Unkown", specialization = nil, parent_permission = true, id = nil)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  # rubocop:enable Style/OptionalBooleanParameter
  def can_use_services
    true
  end

  def to_hash
    {
      id: id,
      age: age,
      name: name,
      specialization: specialization,
      parent_permission: parent_permission,
    }
  end
end
