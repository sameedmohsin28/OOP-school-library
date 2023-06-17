require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission)
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
