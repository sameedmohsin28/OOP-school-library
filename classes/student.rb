require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '\¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*args)
    {
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      class_name: self.class.name
    }.to_json(*args)
  end
end
