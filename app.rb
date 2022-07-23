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
      create_person
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
    student = Student.new(student_age, student_name, is_permitted)
    @people.push(student)
    puts 'Person created succesfully'
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp
    teacher = Teacher.new(teacher_age, teacher_name, teacher_specialization)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @book.push(book)
    puts 'Book created successfully'
  end
end
