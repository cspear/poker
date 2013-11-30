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
    "FROM CARD: #{@number} of #{@suit} with #{@value}"
  end

  def am_i_an_ace?
    if :ace
      true
    else
      false
    end
  end

  def what_suit_am_i?
    if :spades   then spades
    if :clubs    then clubs
    if :diamonds then diamonds
    if :hearts   then hearts
  end




end

# why no methods
#