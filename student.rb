require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission)
    @age = age
    @name = name
    @parent_permission = parent_permission
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  # rubocop:disable Lint/DuplicateMethods
  def classroom=(classroom)
    @classroom = classroom
    classroom.number_of_students.push(self) unless classroom.number_of_students.include?(self)
  end
  # rubocop:enable Lint/DuplicateMethods
end
