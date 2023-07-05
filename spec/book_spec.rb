# require_relative '../classes/rental'
require_relative '../classes/book'

describe Book do
  before :all do
    @book = Book.new('The Walking Dead', 'Unknown')
  end

  it 'takes three arguments and returns the Book object' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'returns all rentals' do
    expect(Book.all_instances.length).to eq(1)
  end

  it 'checks if the list of books is empty' do
    expect(Book.not_instance?).to be false
  end
end
