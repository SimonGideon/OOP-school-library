require './module/common'
require './module/book'
require './person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person, _id = nil)
    @id = Common.next_id
    @date = date
    @book = book
    @person = person
  end

  puts @book
  puts @person

  def book=(book)
    @book = book
    book.add_rental(self) unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.add_rentals
  end

  def to_hash
    {
      id: @id,
      date: date,
      book: @book.to_hash,
      person: @person.to_hash
    }
  end
end
