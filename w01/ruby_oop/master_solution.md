``` ruby
class Animal
  # using attr_accessor: 
  attr_accessor :state

  # OR, using a getter method:
  def state
    @state
  end

  def initialize(input_type)
    @type = input_type
    @state = "awake"
  end

  def eat (food)
    puts "Yum! I, as a #{@type} love to eat #{food}!"
  end

  def sleep
    @state = "asleep"
  end

  def wake
    @state = "awake"
  end
end

# the following initializes a new animal with type "Parrot"
bird = Animal.new("Parrot")
# the eat instance method takes a parameter
bird.eat("Crackers")
# the sleep instance method does not take a parameter
bird.sleep

puts bird.state

class Person < Animal
  attr_accessor :age, :gender, :name
  def initialize(age, gender, name)
    @type = "person"
    @age = age
    @gender = gender
    @name = name
  end

  # this method overrites the Animal eat instance method
  def eat(food)
    response = ""
    if food == "person"
      "Sir! I am NOT a cannibal!"
    else
      "Yum! I am eating #{food}!"
    end
    puts response
  end

  def greet
    puts "Hi, I'm #{@name}. I'm a #{@type}, and #{@age} years old."
  end
end

justin = Person.new(33, "male", "Justin")
jimmy = Person.new(27, "male", "Jimmy")
justin.eat('dogs')
justin.greet
jimmy.eat('person')

```
