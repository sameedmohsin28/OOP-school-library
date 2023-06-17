class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class BaseDecroator < Nameable
  def initialize(name)
    super()
    @nameable = name
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecroator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecroator
  def correct_name
    @nameable.correct_name[0, 10]
  end
end

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services
    @parent_permission || of_age?
  end

  def of_age?
    true if @age >= 18
    false
  end

  def correct_name
    @name
  end

  private :of_age?
end

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '\¯(ツ)/¯'
  end

  def add_classroom(classroom_name)
    @classroom = classroom
    classroom_name.students.push(self) unless classroom_name.students.include?(self)
  end
end

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_students(student)
    @students.push(student)
    student.classroom = self
  end
end

class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end
end
