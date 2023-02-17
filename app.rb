require './module/rental'
require './module/book'
require './person'
require './module/student'
require './module/classroom'
require './module/teacher'

class App
    attr_reader :people, :books
    def initialize()
        @people = []
        @books = []
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
                    puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
                when Teacher
                    puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" 
            end
        end
    end

    def create_person(who, age, specialization=nil, name='Unkown')
        case who
        when "Student"
            person = Student.new(age, name)
            puts "----------------------------------"
            puts "Student:  Name:  #{person.name}"
            puts "          Age:  #{person.age}"
            puts "Student created succesfully"
        when 'Teacher'
            person = Teacher.new(age, specialization, name)
            puts "----------------------------------"
            puts "Teacher:  Name:  #{person.name}"
            puts "          Age:  #{person.age}"
            puts "          Specialization:  #{person.specialization}"
        end
        @people << person
        puts "person created succesfully"
    end

    def create_book(title, author)
        puts "----------------------------------"
        book = Book.new(title, author)
        puts "Book: Title: #{book.title}"
        puts "      Author: #{book.author}"
        @books<<book
        puts "Book created succesfully"
    end
    def create_rental
        
    end
    def list_rentals(id)
        
    end
end