require_relative './app.rb'


class Input
  def initialize(app)
    @app = app
  end

  def input_for_books
    print 'Title of the book: '
    book_title = gets.chomp
    print 'Author of the book: '
    book_author = gets.chomp
    @app.create_a_book(book_title, book_author)
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
    print 'Parent permission (yes/no): '
    parent_permission = gets.chomp
    unless parent_permission.downcase == 'yes' || parent_permission.downcase == 'no'
      puts 'Please write yes or no'
      print 'Parent permission (yes/no): '
      parent_permission = gets.chomp
    end
    parent_permission_boolean = true if parent_permission.downcase == 'yes'
    parent_permission_boolean = false if parent_permission.downcase == 'no'
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

  def input_for_rentals
    puts 'Select a book from the following list by number'
    Book.all_instances.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    rental_book_id = gets.chomp.to_i
    rental_book = Book.all_instances[rental_book_id]
    puts 'Select a person from the following list by number (not by id)'
    @app.persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age:#{person.age}"
    end
    rental_person_id = gets.chomp.to_i
    rental_person = @app.persons[rental_person_id]
    print 'Date: '
    rental_date = gets.chomp
    @app.create_a_rental(rental_date, rental_book, rental_person)
  end

  def input_for_show_person_rentals
    print 'Enter the id of person: '
    person_id_rental = gets.chomp.to_i
    @app.persons.select { |person| person.id == person_id_rental }
    person_objects_array = []
    Rental.all_instances.each do |rental|
      person_objects_array << rental if rental.person.id == person_id_rental
    end
    @app.show_rentals_for_person(person_objects_array)
  end
end