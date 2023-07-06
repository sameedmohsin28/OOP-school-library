require_relative '../classes/classroom'
require_relative '../classes/student'

RSpec.describe Classroom do
  let(:label) { 'Math' }
  let(:classroom) { Classroom.new(label) }
  let(:student) { Student.new(15, 'Harry Potter', true) }

  describe '#initialize' do
    it 'Initializes a new Classroom object using the provided label' do
      expect(classroom.label).to eq(label)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'Adds a new student to the classroom' do
      classroom.add_students(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
