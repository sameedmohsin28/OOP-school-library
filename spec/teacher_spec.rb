require_relative '../classes/teacher'

describe Teacher do
  before :all do
    @teacher = Teacher.new('Math', '30', 'Smith')
  end

  it 'takes three arguments and returns Teacher object' do
    expect(@teacher).to be_an_instance_of(Teacher)
  end

  it 'allows teacher to use services' do
    expect(@teacher.can_use_services).to eql(true)
  end
end
