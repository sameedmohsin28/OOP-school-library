# require_relative './main'

def main_menu
  display_options

  perform_tasks

  main_menu
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

def perform_tasks
  tasks = {
    1 => method(:list_all_books),
    2 => method(:list_all_people),
    3 => method(:create_a_person),
    4 => method(:create_a_book),
    5 => method(:create_a_rental),
    6 => method(:show_rentals_for_person),
    7 => method(:exit_program)
  }

  number_chosen = gets.chomp.to_i

  if tasks.key?(number_chosen)
    tasks[number_chosen].call
  else
    puts 'Invalid entry. Please enter an appropriate number.'
  end
end

def exit_program
  puts 'Thank you for using school library'
  exit
end
