require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  attr_reader :persons, :input

  def initialize
    @persons = []
    @input = Input.new(self)
    load_data_from_files
  end

  def list_all_books
    Book.all_instances.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts ''
  end

  def list_all_people
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age:#{person.age}"
    end
    puts ''
  end

  def create_a_person(person_choice)
    case person_choice
    when 1
      @input.input_for_student

    when 2
      @input.input_for_teacher

    else
      puts 'Please enter an appropriate number'
      @input.input_for_choosing_person
    end
  end

  def create_student(student_age, student_name, parent_permission_boolean)
    person_created = Student.new(student_age, student_name, parent_permission_boolean)
    @persons << person_created
  end

  def create_teacher(teacher_specialization, teacher_age, teacher_name)
    person_created = Teacher.new(teacher_specialization, teacher_age, teacher_name)
    @persons << person_created
  end

  def create_a_book(book_title, book_author)
    Book.new(book_title, book_author)
    puts 'Book created'
    puts ''
  end

  def create_a_rental(rental_date, rental_book, rental_person)
    rental_created = Rental.new(rental_date, rental_book, rental_person)
    @rentals << rental_created
    puts 'Rental has been created'
  end

  def show_rentals_for_person(person_objects_array)
    if person_objects_array.empty?
      puts 'No rentals for the given person'
    else
      puts 'Book rentals'
      person_objects_array.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def save_books_to_json_file
    File.write('../dataFiles/books.json', JSON.generate(Book.all_instances))
  end

  def save_persons_to_json_file
    File.write('../dataFiles/persons.json', JSON.generate(@persons))
  end

  def save_rentals_to_json_file
    File.write('../dataFiles/rentals.json', JSON.generate(Rental.all_instances))
  end

  def load_books_from_json_file
    return unless File.exist?('../dataFiles/books.json')

    load_books = JSON.parse(File.read('../dataFiles/books.json'))
    load_books.each do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def load_persons_from_json_file
    return unless File.exist?('../dataFiles/persons.json')

    load_persons = JSON.parse(File.read('../dataFiles/persons.json'))
    load_persons.each do |person|
      if person['class_name'] == 'Student'
        student = Student.new(person['age'], person['name'], person['parent_permission'])
        @persons << student
      elsif person['class_name'] == 'Teacher'
        teacher = Teacher.new(person['specialization'], person['age'], person['name'])
        @persons << teacher
      end
    end
  end

  def load_rentals_from_json_file
    load_rentals = JSON.parse(File.read('../dataFiles/rentals.json'))
    load_rentals.each do |rental|
      req_book = Book.all_instances.find { |book| book.title == rental['book_title'] }
      req_person = @persons.find { |person| person.name == rental['person_name'] }
      Rental.new(rental['date'], req_book, req_person)
    end
  end

  def save_data_to_files
    save_books_to_json_file
    save_persons_to_json_file
    save_rentals_to_json_file
  end

  def load_data_from_files
    load_books_from_json_file
    load_persons_from_json_file
    load_rentals_from_json_file
  end
end
