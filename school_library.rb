class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getters
  attr_accessor :name

  attr_accessor :age

  Private def of_age
    @age >= 18
  end
  def can_use_services
    return unless @age >= 18 || parent_permission

    true
  end
end
