class Person
  def initialize(name = 'Unknown', age, parent_permission)
    @id = id
    @name = name
    @age = age
  end
  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def is_of_age?
    @age >= 18
  end

  private :is_of_age?

  # def can_use_services?
  #   if is_of_age? || @parent_permission
  #     true
  #   end
  # end
end
