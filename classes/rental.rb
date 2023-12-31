require_relative 'book'
require_relative 'person'

class Rental
  @all_rentals = []

  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self

    self.class.all_instances << self
  end

  def self.all_instances
    @all_rentals
  end

  def to_json(*args)
    {
      date: @date,
      book_title: @book.title,
      person_name: @person.name
    }.to_json(*args)
  end
end
