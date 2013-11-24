

class Card

  NUMBERS = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  SUITS  =  [:spades, :clubs, :diamonds, :hearts]
  SHORT   = [:s, :c, :d, :h]
  VALUES  = [2..14]

  attr_reader :number, :suit, :value

  def initialize(number, suit, value)
    @number = number
    @suit   = suit
    @value  = value
  end

  def to_s
    # "FROM CARD: #{@number}:#{@suite}-#{@value}"
    "#{@number} of #{@suit}"
    # "#{@number} of #{@suite}"
  end

end

# why no methods
#