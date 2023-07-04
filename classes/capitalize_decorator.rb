require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecroator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
