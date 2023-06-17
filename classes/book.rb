class Book
  @@all_books = []

  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@all_books << self
  end

  def self.all_instances
    @@all_books
  end
end
