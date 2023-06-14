require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
TrimmerDecorator.new(capitalizedPerson)
capitalized_trimmedP_person.correct_name
