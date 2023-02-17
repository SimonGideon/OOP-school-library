#!/usr/bin/env ruby
def main
  puts "Please enter your name: "
  name = gets.chomp
    loop do
    puts "Hey, #{name}! Please choose an option: "
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
      puts "You chose option 3"
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

