require './module/rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  # hashing
  def to_hash
    {
      title: title,
      author: author
    }
  end
end
