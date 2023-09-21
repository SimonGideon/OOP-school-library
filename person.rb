require "./module/nameable"
require "./module/common"
require "./module/rental"

class Person < Nameable
  attr_accessor :name, :age, :rentals, :book, :date
  attr_reader :id

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = "Unknown", parent_permission = true, id = nil)
    super()
    @id = Common.next_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # rubocop:enable Style/OptionalBooleanParameter

  def can_use_services
    return unless @age >= 18 || @parent_permission

    true
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end

  def add_rentals(book, date)
    @rentals << Rental.new(date, book, self)
  end
end
