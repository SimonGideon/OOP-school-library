require 'colorize'

def intro
  puts '========================================'.colorize(:blue)
  puts 'LIBRARY SYSTEM'.colorize(:green)
  puts 'Welcome to Book Rental Module app'.colorize(:yellow)
  puts '========================================'.colorize(:blue)
  puts 'We provide a wide range of books for your reading pleasure.'.colorize(:light_blue)
  puts 'Explore our collection and enjoy your reading journey!'.colorize(:light_blue)
  puts '========================================'.colorize(:blue)
end

def exits
  puts '========================================'.colorize(:blue)
  puts 'Exiting...'.colorize(:red)
  puts 'Thank you for using the Library System app!'.colorize(:light_red)
  puts '========================================'.colorize(:blue)
end

def below
  puts '========================================'.colorize(:blue)
end

def mid
  puts '----------------------------------------'.colorize(:light_green)
end
