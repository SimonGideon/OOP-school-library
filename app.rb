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

    def create_person(who, age, specialization=nil, name='Unkown')
        case who
        when "Student"
            my_student = Student.new(name, age)
            puts "----------------------------------"
            puts "Student:  Name:  #{my_student.name}"
            puts "          Age:  #{my_student.age}"
            puts "----------------------------------"
        when 'Teacher'
            my_teacher = Teacher.new(age, specialization, name)
            puts "----------------------------------"
            puts "Teacher:  Name:  #{my_teacher.name}"
            puts "          Age:  #{my_teacher.age}"
            puts "          Specialization:  #{my_teacher.specialization}"
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