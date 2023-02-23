require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(20, 'John', 'Mathematics', false)
  end

  describe '#specialization' do
    it 'returns the specialization of the teacher' do
      expect(@teacher.specialization).to eq('Mathematics')
    end

    it 'can be changed' do
      @teacher.specialization = 'Science'
      expect(@teacher.specialization).to eq('Science')
    end
  end

  describe '#can_use_services' do
    it 'returns true' do
      expect(@teacher.can_use_services).to be_truthy
    end
  end
end
