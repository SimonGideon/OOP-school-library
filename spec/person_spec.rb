require 'spec_helper'
describe Person do
    before :each do
        @person = Person.new(age = 20, name ='John', parent_permission = true)
    end
    describe '#name' do
        it 'returns the name' do
            expect(@person.name).to eq('John')
        end

        it 'returns an instance of Person' do
            @person.should be_an_instance_of(Person)
        end

        it 'Throw an error when the fewer arguments are passed' do
            expect { Person.new() }.to raise_error(ArgumentError)
        end
    end
end