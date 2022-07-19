class Person
  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def of_age?
    return true if @age >= 18
  end

  private :of_age?

  def can_use_services?
    return true if of_age? || @parent_permission
  end
end
