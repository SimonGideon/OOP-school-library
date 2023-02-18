#!/usr/bin/env ruby
require './app'
require 'date'

class Main
  def initialize()
    @my_app = App.new
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
      handle_create_person
    when 4
      handle_create_book
    when 5
      handle_create_rental
    when 6
      handle_list_rentals
    else
      puts 'Invalid option'
    end
  end

  def handle_create_person
    puts 'Choose a person: Student(1), Teacher(2). Enter the number.'
    op_person = gets.chomp.to_i
    case op_person
    when 2
      create_teacher
    when 1
      create_student
    else
      puts 'Invalid option'
    end
  end

  def loo_permission
    puts 'Has parent Permission? [Y/N]: '
    input = gets.chomp.downcase
    case input
    when 'n'
      false
    when 'y'
      true
    else
      puts 'Invalid input'
    end
  end

  def create_teacher
    puts 'Enter Teachers Age: '
    age = gets.chomp.to_i
    puts 'Enter Teachers name: '
    name = gets.chomp.to_s
    puts 'Enter Specialization: '
    specialization = gets.chomp.to_s
    parent_permission = loo_permission
    @my_app.create_person('Teacher', age, name, specialization, parent_permission)
  end

  def create_student
    puts 'Enter students age: '
    age = gets.chomp.to_i
    puts 'Enter students name: '
    name = gets.chomp.to_s
    parent_permission = loo_permission
    @my_app.create_person('Student', age, name, parent_permission)
  end

  def handle_create_book
    puts 'Title: '
    title = gets.chomp.to_s
    puts 'Author: '
    author = gets.chomp.to_s
    @my_app.create_book(title, author)
  end

  def handle_create_rental
    @my_app.gets_book
    @my_app.gets_person
    puts 'Enter book index:'
    book_index = gets.chomp.to_i
    puts 'Enter person Index:'
    person_index = gets.chomp.to_i
    puts 'Enter date(YYYY-MM-DD): '
    date_input = gets.chomp
    date = Date.parse(date_input)
    @my_app.create_rental(book_index, person_index, date)
  end

  def handle_list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    @my_app.list_rentals(person_id)
  end
end

main = Main.new
main.run
