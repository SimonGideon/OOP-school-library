require_relative '../person'
require_relative '../module/student'
require_relative '../module/teacher'
require_relative '../module/book'
require_relative '../module/rental'
require_relative '../module/classroom'

# enable should syntax
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = %i[expect should]
  end
end
