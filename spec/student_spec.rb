require 'spec_helper'
describe Student do
  before :each do
    @student = Student.new(20, 'John', true)
  end

  describe '#name' do
    # returns a new object of the class Student
    it 'returns the name of the student' do
      @student.should be_an_instance_of(Student)
    end

    it 'returns the name of the student' do
      expect(@student.name).to eq('John')
    end

    it 'returns the age of the student' do
      expect(@student.age).to eq(20)
    end
  end
end
