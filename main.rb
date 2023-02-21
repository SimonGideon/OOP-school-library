#!/usr/bin/env ruby
require './app'
require 'date'

# base class
class Main
  def initialize()
    @my_app = App.new
    @person_handler = PersonHandler.new(@my_app)
    @rentals_handler = Rentals.new(@my_app)
    @books_handler = BooksHandler.new(@my_app)
  end

  def run
    puts 'Welcome to our app'
    loop do
      display_options
      option = gets.chomp.to_i
      handle_option(option)
      break if option == 7
    end
    puts 'Exiting......'
  end

  def display_options
    puts 'Please choose an option: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def handle_option(option)
    case option
    when 1
      @my_app.list_books
    when 2
      @my_app.list_people
    when 3
      @person_handler.handle_create_person
    when 4
      @books_handler.handle_create_book
    when 5
      @rentals_handler.handle_create_rental
    when 6
      @rentals_handler.handle_list_rentals
    else
      puts 'Invalid option'
    end
  end
end

main = Main.new
main.run
