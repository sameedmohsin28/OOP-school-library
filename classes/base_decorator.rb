require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(name)
    super()
    @nameable = name
  end

  def correct_name
    @nameable.correct_name
  end
end
