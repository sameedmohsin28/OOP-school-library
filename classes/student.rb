require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = 'none'
  end

  def play_hooky
    '\¯(ツ)/¯'
  end

  def add_classroom(classroom_name)
    @classroom = classroom
    classroom_name.students.push(self) unless classroom_name.students.include?(self)
  end
end
