require_relative './nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name, parent_permission)
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
