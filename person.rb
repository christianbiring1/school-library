class Person
  def initialize(age, parent_permission = true, name = 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def is_of_age?
    @age >= 18
  end

  private :is_of_age?

  def can_use_services?
    true if is_of_age? || @parent_permission
  end
end
