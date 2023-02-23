require 'spec_helper'

describe Rental do
  let(:book) { Book.new('The Catcher in the Rye', 'J.D. Salinger') }
  let(:person) { Person.new(18, 'John', true) }
  let(:rental) { Rental.new('2022-02-21', book, person) }

  describe '#book=' do
    it 'sets the book attribute of the rental' do
      rental.book = book
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the book rentals list' do
      expect { rental.book = book }.to change { book.rentals.count }.by(1)
    end

    it 'does not add the rental to the book rentals list if it already exists' do
      rental.book = book
      expect(rental.book).to have_attributes(title: book.title, author: book.author)
    end
  end
end
