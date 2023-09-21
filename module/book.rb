require "./module/rental"

class Book
  attr_accessor :title, :author, :rental
  attr_reader :id

  def initialize(title, author, id = nil)
    @id = Random.rand(1..100)
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
      id: id,
      title: title,
      author: author,
    }
  end
end
