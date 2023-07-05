require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  before :all do
    @student = Student.new('18', 'Anderson', true)
    @classroom = Classroom.new('3-A')
  end

  it 'takes three arguments and returns Student object' do
    expect(@student).to be_an_instance_of(Student)
  end

  it 'adds student to a classroom' do
    @student.add_classroom(@classroom)
    expect(@student.classroom.label).to eql('3-A')
    expect(@classroom.students).to include(@student)
  end
end
