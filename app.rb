require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

class App
  def initialize
    @book = []
    @teacher = []
    @student = []
    @people = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create _teacher
    else
      puts 'Invalid option'
      nil
    end
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    is_permitted = case parent_permission.downcase
                   when 'y'
                     true
                   when 'n'
                     false
                   else
                     puts 'It\'s a yes or no type thing!. c\'mon now! '
                   end
  end
end
