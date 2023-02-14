class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getters
  attr_reader :name

  attr_reader :age

  Private def of_age
    @age >= 18
  end
  def can_use_services
    return unless @age >= 18 || parent_permission

    true
  end
end
