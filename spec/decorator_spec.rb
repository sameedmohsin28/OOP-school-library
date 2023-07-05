require_relative '../classes/nameable'
require_relative '../classes/base_decorator'
require_relative '../classes/capitalize_decorator'
require_relative '../classes/trimmer_decorator'

describe Nameable do
  it 'Shows NotImplementedError whenever correct_name method is called' do
    name = Nameable.new
    expect { name.correct_name }.to raise_error(NotImplementedError)
  end
end

describe BaseDecorator do
  it 'Provides correct_name method to the decorated object' do
    object = double('object')
    allow(object).to receive(:correct_name).and_return('Harry Potter')

    decorator = BaseDecorator.new(object)
    expect(decorator.correct_name).to eq('Harry Potter')
  end
end

describe CapitalizeDecorator do
  it 'Capitalizes the name provided by the decorated object' do
    object = double('object')
    allow(object).to receive(:correct_name).and_return('harry potter')

    decorator = CapitalizeDecorator.new(object)
    expect(decorator.correct_name).to eq('Harry potter')
  end
end

describe TrimmerDecorator do
  it 'Trims the name if it exceeds 10 characters' do
    object= double('object')
    allow(object).to receive(:correct_name).and_return('Harry Potter')

    decorator = TrimmerDecorator.new(object)
    expect(decorator.correct_name).to eq('Harry Pott')
  end

  it 'Does not trim the name if it not exceeds 10 characters' do
    object= double('object')
    allow(object).to receive(:correct_name).and_return('Will Blue')

    decorator = TrimmerDecorator.new(object)
    expect(decorator.correct_name).to eq('Will Blue')
  end
end