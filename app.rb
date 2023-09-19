require "./module/rental"
require "./module/book"
require "./person"
require "./module/student"
require "./module/classroom"
require "./module/teacher"
require "json"

class App
  attr_reader :people, :books, :rentals

  def initialize()
    @people = []
    @books = []
    @rentals = []
    load_data
  end

  # load data
  def load_data
    people_data = File.read("./module/people.json")
    books_data = File.read("./module/books.json")
    rentals_data = File.read("./module/rentals.json")

    # Check if the JSON data is empty
    if people_data.empty? || books_data.empty? || rentals_data.empty?
      puts "One or more JSON files are empty. Unable to load data."
      return
    end

    @people = JSON.parse(people_data).map do |person|
      if person.key?("specialization")
        Teacher.new(person["name"], person["age"], person["specialization"], person["parent_permission"], person["id"])
      else
        Student.new(person["age"], person["name"], person["parent_permission"], person["id"])
      end
    end
    @books = JSON.parse(books_data).map do |book|
      Book.new(book["title"], book["author"], book["id"])
    end
    @rentals = JSON.parse(rentals_data).map do |rental|
      Rental.new(rental["date"], rental["book"], rental["person"], rental["id"])
    end
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

  def create_person(who, age, name, specialization = nil, parent_permission = true)
    case who
    when "Student"
      person = Student.new(age, name, parent_permission)
      puts "----------------------------------"
      puts "Student:  Name:  #{person.name}"
      puts "          Age:  #{person.age}"
      puts "          Parent Permission: #{person.parent_permission}"
      puts "Student created succesfully"
    when "Teacher"
      person = Teacher.new(name, age, specialization, parent_permission)
      puts "----------------------------------"
      puts "Teacher:  Name:  #{person.name}"
      puts "          Age:  #{person.age}"
      puts "          Specialization:  #{person.specialization}"
      puts "          Parent Permission:  #{person.parent_permission}"
    end
    @people << person
    puts "person created succesfully"
  end

  def create_book(title, author)
    puts "----------------------------------"
    book = Book.new(title, author)
    puts "Book: Title: #{book.title}"
    puts "      Author: #{book.author}"
    @books << book
    puts "Book created succesfully"
  end

  def create_rental(book_index, person_index, d_date)
    book = @books[book_index]
    person = @people[person_index]
    date = d_date
    @rentals << Rental.new(date, book, person)
    puts "Rental Created."
  end

  def list_rentals(_id)
    puts "Rentals:"
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

  def save_data
    all_data = [@people, @books, @rentals]
    file_paths = ["./module/people.json", "./module/books.json", "./module/rentals.json"]

    # Iterate on both arrays
    all_data.zip(file_paths).each do |data, file_path|
      saver = JsonHandler.new(data, file_path)
      saver.save
    end
  end
end

# Create a new instance of JsonHandler to handle all the data
class JsonHandler
  def initialize(data, file_path)
    @data = data
    @file_path = file_path
  end

  def save
    # format the data
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: "  ",
      space_before: " ",
      space: " ",
    }

    # creates the files if doesnt exits and writes on them.
    File.open(@file_path, "w") do |file|
      file.write(JSON.pretty_generate(@data.map(&:to_hash), opts))
    end
  end
end

# person handler
class PersonHandler
  def initialize(app)
    @my_app = app
  end

  def handle_create_person
    puts "Choose a person: Student(1), Teacher(2). Enter the number."
    op_person = gets.chomp.to_i
    case op_person
    when 2
      create_teacher
    when 1
      create_student
    else
      puts "Invalid option"
    end
  end

  private

  def loo_permission
    puts "Has parent Permission? [Y/N]: "
    input = gets.chomp.downcase
    case input
    when "n"
      false
    when "y"
      true
    else
      puts "Invalid input"
    end
  end

  def create_teacher
    puts "Enter Teachers Age: "
    age = gets.chomp.to_i
    puts "Enter Teachers name: "
    name = gets.chomp.to_s
    puts "Enter Specialization: "
    specialization = gets.chomp.to_s
    parent_permission = loo_permission
    @my_app.create_person("Teacher", age, name, specialization, parent_permission)
  end

  def create_student
    puts "Enter students age: "
    age = gets.chomp.to_i
    puts "Enter students name: "
    name = gets.chomp.to_s
    parent_permission = loo_permission
    @my_app.create_person("Student", age, name, parent_permission)
  end
end

# rentals class
class Rentals
  def initialize(app)
    @my_app = app
  end

  def handle_create_rental
    @my_app.gets_book
    @my_app.gets_person
    puts "Enter book index:"
    book_index = gets.chomp.to_i
    puts "Enter person Index:"
    person_index = gets.chomp.to_i
    puts "Enter date(YYYY-MM-DD): "
    date_input = gets.chomp
    date = Date.parse(date_input)
    @my_app.create_rental(book_index, person_index, date)
  end

  def handle_list_rentals
    print "ID of person: "
    person_id = gets.chomp.to_i
    @my_app.list_rentals(person_id)
  end
end

# book handler
class BooksHandler
  def initialize(app)
    @my_app = app
  end

  def handle_create_book
    puts "Title: "
    title = gets.chomp.to_s
    puts "Author: "
    author = gets.chomp.to_s
    @my_app.create_book(title, author)
  end
end
