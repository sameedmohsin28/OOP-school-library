# require_relative './main'

def main_menu
  puts "Please choose an option by entering a number"
  puts "1 - List all books"
  puts "2 - List all people"
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a rental"
  puts "6 - List all rentals for a given person id"
  puts "7 - exit"

  number_chosen = gets.chomp.to_i

  case number_chosen
  when 1
    list_all_books
  when 2
    list_all_people
  when 3
    create_a_person
  when 4
    create_a_book
  when 5
    create_a_rental
  when 6
    show_rentals_for_person
  when 7
    puts "Thank you for using school library"
    exit
  else
    puts "Invalid entry. Please enter an appropriate number."
  end

  main_menu
end
