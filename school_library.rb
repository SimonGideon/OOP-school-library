require './module/nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getters
  attr_accessor :name

  attr_accessor :age

  def can_use_services
    return unless @age >= 18 || parent_permission

    true
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end
end

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.upcase!
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.splice(0, 9)
  end
end
