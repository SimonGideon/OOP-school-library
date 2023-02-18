require './module/rental'
require './module/book'
require './person'
require './module/student'
require './module/classroom'
require './module/teacher'

class App
  attr_reader :people, :books, :rentals

  def initialize()
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title},  Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      case person
      when Student
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age},
         Parent Person: #{person.parent_permission}"
      when Teacher
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person(who, age, name, parent_permission, specialization = nil)
    case who
    when 'Student'
      person = Student.new(age, name, parent_permission)
      puts '----------------------------------'
      puts "Student:  Name:  #{person.name}"
      puts "          Age:  #{person.age}"
      puts "          Parent Permission: #{person.parent_permission}"
      puts 'Student created succesfully'
    when 'Teacher'
      person = Teacher.new(name, age, specialization, parent_permission)
      puts '----------------------------------'
      puts "Teacher:  Name:  #{person.name}"
      puts "          Age:  #{person.age}"
      puts "          Specialization:  #{person.specialization}"
      puts "          Parent Permission:  #{person.parent_permission}"
    end
    @people << person
    puts 'person created succesfully'
  end

  def create_book(title, author)
    puts '----------------------------------'
    book = Book.new(title, author)
    puts "Book: Title: #{book.title}"
    puts "      Author: #{book.author}"
    @books << book
    puts 'Book created succesfully'
  end

  def create_rental(book_index, person_index, d_date)
    book = @books[book_index]
    person = @people[person_index]
    date = d_date
    @rentals << Rental.new(date, book, person)
    puts 'Rental Created.'
  end

  def list_rentals(_id)
    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book '#{rental.book.title}' By #{rental.person.name} "
      end
    end
  end

  def gets_book()
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
  end

  def gets_person()
    @people.each_with_index do |person, index|
      case person
      when Student
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      when Teacher
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
end
