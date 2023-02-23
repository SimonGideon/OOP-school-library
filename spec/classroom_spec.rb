require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Math')
    @student = Student.new(16, 'John')
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      expect { @classroom.add_student(@student) }.to change { @classroom.students.count }.by(1)
    end

    it 'sets the classroom attribute of the student to the current classroom' do
      @classroom.add_student(@student)
      expect(@student.classroom).to eq(@classroom)
    end
  end
end
