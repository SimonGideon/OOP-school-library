require "./module/common"
require "./module/rental"

class Book
  attr_accessor :title, :author, :rental
  attr_reader :id

  def initialize(title, author, id = nil)
    @id = Common.next_id
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
