

class Card

  NUMBERS = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  SUITES  = [:spades, :clubs, :diamonds, :hearts]
  SHORT   = [:s, :c, :d, :h]
  VALUES  = [2..14]

  attr_reader :number, :suite, :value

  def initialize(number, suite, value)
    @number = number
    @suite  = suite
    @value  = value
  end

  def to_s
    # "FROM CARD: #{@number}:#{@suite}-#{@value}"
    "#{@number}----#{@suite}"
    # "#{@number} of #{@suite}"
  end

end