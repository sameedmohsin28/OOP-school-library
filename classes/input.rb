require 'json'
require_relative 'app'


class Input
  def initialize(app)
    @app = app
  end

  def input_for_choosing_person
    puts 'Do you want to create a student (1) or a teacher (2)'
    person_choice = gets.chomp.to_i
    @app.create_a_person(person_choice)
  end

  def input_for_student
    puts 'Please enter the following details for the student'
    print 'Name: '
    student_name = gets.chomp
    print 'Age: '
    student_age = gets.chomp
    print 'Parent permission (y/n): '
    parent_permission = gets.chomp
    unless parent_permission.downcase == 'y' || parent_permission.downcase == 'n'
      puts 'Please write y or n'
      print 'Parent permission (y/n): '
      parent_permission = gets.chomp
    end
    parent_permission_boolean = true if parent_permission.downcase == 'y'
    parent_permission_boolean = false if parent_permission.downcase == 'n'
    @app.create_student(student_age, student_name, parent_permission_boolean)
  end

  def input_for_teacher
    puts 'Please enter the following details for the teacher'
    print 'Name: '
    teacher_name = gets.chomp
    print 'Age: '
    teacher_age = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp
    @app.create_teacher(teacher_specialization, teacher_age, teacher_name)
  end

  def input_for_books
    print 'Title of the book: '
    book_title = gets.chomp
    print 'Author of the book: '
    book_author = gets.chomp
    @app.create_a_book(book_title, book_author)
  end

  ###
  def input_for_rentals(main_instance)
    puts 'Select a book from the following list by number'
    check_for_book
    Book.all_instances.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    rental_book_id = gets.chomp.to_i
    # check rental_book_id < index
    check_rental_book_id(rental_book_id)
    rental_book = Book.all_instances[rental_book_id]
    check_for_persons(main_instance)
    puts 'Select a person from the following list by number (not by id)'
    @app.persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age:#{person.age}"
    end
    rental_person_id = gets.chomp.to_i
    # check rental_person_id < index
    check_rental_person_id(rental_person_id)
    rental_person = @app.persons[rental_person_id]
    print 'Date: '
    rental_date = gets.chomp
    @app.create_a_rental(rental_date, rental_book, rental_person)
  end

  ###
  def check_rental_person_id(rental_person_id)
    return unless rental_person_id.negative? || rental_person_id >= @app.persons.length

    puts 'Invalid person selection.'
    main_instance.main
  end

  def check_rental_book_id(rental_book_id)
    return unless rental_book_id.negative? || rental_book_id >= Book.all_instances.length

    puts 'Invalid book selection.'
    main_instance.main
  end

  def input_for_show_person_rentals(main_instance)
    check_for_persons(main_instance)
    puts 'Select a person from the following list by ID'
    @app.persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}"
    end
    print 'Enter the id of person: '
    person_id_rental = gets.chomp.to_i
    @app.persons.select { |person| person.id == person_id_rental }
    person_objects_array = []
    Rental.all_instances.each do |rental|
      person_objects_array << rental if rental.person.id == person_id_rental
    end
    @app.show_rentals_for_person(person_objects_array)
  end

  def check_for_persons(main_instance)
    return unless @app.persons.empty?

    puts 'There are no persons in the record.'
    puts ''
    main_instance.main
  end

  def check_for_book
    return unless Book.not_instance?

    puts "There are no books in the library \n"
    main_instance.main
  end
end
