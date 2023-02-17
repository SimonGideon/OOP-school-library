require './module/rental'
require './module/book'
require './person'
require './module/student'
require './module/classroom'
require './module/teacher'

class App
    def list_books
        
    end

    def list_people

    end

    def create_person(who, age, name, specialization=nil)
        case who
        when "Student"
            my_student = Student.new(name, age)
            puts "----------------------------------"
            puts "Student:  Name:  #{my_student.name}"
            puts "          Age:  #{my_student.age}"
            puts "----------------------------------"
        when 'Teacher'
            my_teacher = Teacher.new(age, name)
            puts "----------------------------------"
            puts "Teacher:  Name:  #{my_teacher.name}"
            puts "          Age:  #{my_teacher.age}"
            puts "----------------------------------"
        else
            return nil
        end
    end

    def create_book

    end
    def create_rental

    end
    def list_rentals(id)
        
    end
end