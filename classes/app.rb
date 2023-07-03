require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :persons, :input

  def initialize
    @persons = []
    @input = Input.new(self)
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
    Rental.new(rental_date, rental_book, rental_person)
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
end
