require './module/book'
require './person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date)
    @date = date
  end

  def book=(book)
    @book = book
    book.add_rental(self) unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end
end
