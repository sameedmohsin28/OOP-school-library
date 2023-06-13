class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = 'Unknown', age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    if @parent_permission && of_age?
      true
    end
    false
  end

  private
  def of_age?
    if @age >= 18
      true
    end
    false
  end
end
