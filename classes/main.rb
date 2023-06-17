require_relative './app'

def main
  app = App.new
  app.home
end

def display_options
  puts 'Please choose an option by entering a number'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - exit'
end

def perform_tasks(input)
  case input
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
  else
    puts 'Invalid option. Retry'
  end
end

main
