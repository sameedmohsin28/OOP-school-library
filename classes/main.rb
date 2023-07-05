require_relative 'app'
require_relative 'input'

class Main
  def main
    @app = App.new
    home
  end

  def display_options
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def perform_tasks(number_choice)
    case number_choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.input.input_for_choosing_person
    when 4
      @app.input.input_for_books
    when 5
      @app.input.input_for_rentals(self)
    when 6
      @app.input.input_for_show_person_rentals(self)
    else
      puts 'Invalid option. Retry'
    end
  end

  def home
    puts 'Welcome to School Library Application'
    until display_options
      number_choice = gets.chomp.to_i
      if number_choice == 7
        @app.save_data_to_files
        puts 'Thanks for using school library'
        exit
      end

      perform_tasks(number_choice)
    end
  end
end

main_instance = Main.new
main_instance.main
