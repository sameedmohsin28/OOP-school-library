class Book
  @all_books = []

  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.all_instances << self
  end

  def self.all_instances
    @all_books
  end

  def self.not_instance?
    @all_books.empty?
  end
end
