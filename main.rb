#!/usr/bin/env ruby
require './app'
def main
  puts "Welcome to our app"
    loop do
    puts "Please choose an option: "
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    
    option = gets.chomp.to_i
    
    case option
    when 1
      puts "You chose option 1"
    when 2
      puts "You chose option 2"
    when 3
      puts "Choose a person: Teacher(1), Student(2). Enter the number."
      op_person =  gets.chomp.to_i
      my_app = App.new()
      case op_person
      when 1
        puts 'Enter Teachers Age: '
        age = gets.chomp.to_i
        puts 'Enter Teachers name: '
        name = gets.chomp.to_s
        puts 'Enter Specialization: '
        specialization = gets.chomp.to_s
        my_person = my_app.create_person("Teacher", age, specialization, name)
      when 2
        puts 'Enter students age: '
        age = gets.chomp.to_i
        puts 'Enter students name: '
        name = gets.chomp.to_s
        my_person = my_app.create_person("Student", age, name)
      end
    when 4
        puts "You chose option 3"
    when 5
        puts "You chose option 3"
    when 6
        puts "You chose option 3"
    when 7
        puts "Exiting......"
        break
    else
      puts "Invalid option"
    end
    end
end

main

