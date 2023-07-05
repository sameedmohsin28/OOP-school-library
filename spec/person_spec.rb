require_relative '../classes/person'

describe Person do
  before :all do
    @person = Person.new('18', 'John', true)
  end

  it 'takes three parameters and returns Person object' do
    expect(@person).to be_an_instance_of(Person)
  end

  it 'checks eligibility of the person' do
    expect(@person.can_use_services).to be(true)
  end

  it 'returns correct name' do
    expect(@person.correct_name).to eql(@person.name)
  end
end
