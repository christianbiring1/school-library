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
    @rental = []
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

  def create_rental
    if !@book.empty && !@people.empty?
      puts 'Select a book from the following list by number'
      @book.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
      id = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, #{person.age}"
      end
      person_id = gets.chomp.to_i
      puts 'Enter the date in this format yy/mm/dd: '
      date = gets.chomp
      person_rental = Rental.new(@book[id], @people[person_id], date)
      @rental.push(person_rental)
      puts 'Rental creared successfully'
    else
      puts 'There must be a person and some book for a rental to take place!'
    end
  end

  def rental_list
    if !@rental.empty?
      print 'Enter the person_id you wanna get the rental for: '
      person_id = gets.chomp.to_i
      list_rental(person_id)
    else
      puts 'Rentals doesn\'t exist yet! come back later'
    end
  end

  def initial
    puts 'Welcome to School Library App!'
    display_options
  end

  def display_options
    puts 'Please choose an option by entering a number'
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person.'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rentals.'
    puts '7. Exit app'

    option_id = gets.chomp
    puts option_id
    run_app(option_id)
  end

  def run_app(option_id)
    case option_id
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      rental_list
    when '7'
      exit
    else
      puts 'Choose an existing option!..'
    end
    display_options
  end
end
