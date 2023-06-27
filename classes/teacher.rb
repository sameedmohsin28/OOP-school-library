require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name, parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end

  def to_json (*args)
    {
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      specialization: @specialization,
      class_name: self.class.name
    }.to_json(*args)
  end
end
