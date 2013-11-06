

class Card

  NUMBERS = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  SUITES  = [:spades, :clubs, :diamonds, :hearts]
  VALUES  = [2..14]

  attr_reader :number, :suite, :value

  def initialize(number, suite, value)
    @number = number
    @suite  = suite
    @value  = value
  end

  def to_s
    "FROM CARD: #{@number}:#{@suite}-#{@value}"
  end

  # card must have a number, suite, and value
  # card must have a number in numbers list
  # card must have a suite in suites list
  # card must have a value in values list
  # card cannot have less than these 3 attributes.
  # card cannot have more than these 3 attributes.
  #
end