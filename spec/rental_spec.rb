require_relative '../classes/rental'
require_relative '../classes/book'

describe Rental do
  before :all do
    person = Person.new('18', 'John', true)
    book = Book.new('The Walking Dead', 'Unknown')
    @rental = Rental.new('05/07/2023', book, person)
  end

  it 'takes three arguments and returns the Rental object' do
    expect(@rental).to be_an_instance_of(Rental)
  end

  it 'returns all rentals' do
    expect(Rental.all_instances.length).to eq(1)
  end
end
