require_relative "./student"
require_relative "./teacher"
require_relative "./book"
require_relative "./app"
require_relative "./rental"
# require_relative "./"

def list_all_books
  Book.all_instances.each do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
  puts ""
end

def list_all_people
  Person.all_instances.each do |person|
    puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age:#{person.age}"
  end
  puts ""
end

def create_a_person
  puts "Do you want to create a student (1) or a teacher (2)"
  person_choice = gets.chomp.to_i

  case person_choice
  when 1
    puts "Please enter the following details for the student"
    print "Name: "
    student_name = gets.chomp
    print "Age: "
    student_age = gets.chomp
    print "Classroom: "
    student_classroom = gets.chomp
    print "Parent permission (yes/no): "
    parent_permission = gets.chomp
    unless parent_permission.downcase == "yes" || parent_permission.downcase == "no"
      puts "Please write yes or no"
      print "Parent permission (yes/no): "
      parent_permission = gets.chomp
    end
    if parent_permission.downcase == "yes"
      parent_permission_boolean = true
    elsif parent_permission.downcase == "no"
      parent_permission_boolean = false
    end
    person_student = Student.new(student_classroom, student_age, student_name, parent_permission_boolean)

  when 2
    puts "Please enter the following details for the teacher"
    print "Name: "
    teacher_name = gets.chomp
    print "Age: "
    teacher_age = gets.chomp
    print "Specialization: "
    teacher_specialization = gets.chomp
    person_teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name)

  else
    puts "Please enter an appropriate number"
    create_a_person()
  end

  main_menu
end

def create_a_book
  books_array = []
  print "Title of the book: "
  book_title = gets.chomp
  print "Author of the book: "
  book_author = gets.chomp
  book = Book.new(book_title, book_author)
  puts "Book created"
  puts ""

  main_menu
end

def create_a_rental
  puts "Select a book from the following list by number"
  Book.all_instances.each_with_index do |book, index|
    puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
  end
  rental_book_id = gets.chomp.to_i
  rental_book = Book.all_instances[rental_book_id]
  puts "Select a person from the following list by number (not by id)"
  Person.all_instances.each_with_index do |person, index|
    puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age:#{person.age}"
  end
  rental_person_id = gets.chomp.to_i
  rental_person = Person.all_instances[rental_person_id]
  print "Date: "
  rental_date = gets.chomp
  Rental.new(rental_date, rental_book, rental_person)
  puts "Rental has been created"
end

def show_rentals_for_person
  print "Enter the id of person: "
  person_id_rental = gets.chomp.to_i
  person_object = Person.all_instances.select { |person| person.id == person_id_rental }
  person_objects_array = []
  Rental.all_instances.each do |rental|
    if rental.person.id == person_id_rental
      person_objects_array << rental
    end
  end
  puts "Book rentals"
  person_objects_array.each do |rental|
    puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
  end
end

def main
  puts main_menu
end

main
