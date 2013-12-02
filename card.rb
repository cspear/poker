class Card

  NUMBERS       = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  VALUES        = [2..14]
  SHORT_NUM     = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS         = [:spades, :clubs, :diamonds, :hearts]
  SHORT_SUIT    = [:S, :C, :D, :H]
  attr_reader :number, :suit, :value

  def initialize(number, suit, value, short_suit, short_num)
    @number     = number
    @suit       = suit
    @value      = value
    @short_suit = short_suit
    @short_num  = short_num
  end

  def to_s
    "FROM CARD: #{@number} of #{@suit} with #{@value}"
  end

  def number
    @number
  end

  def suit
    @suit
  end

  def value
    @value
  end

  def short_num
    @short_num
  end

  def short_suit
    @short_suit
  end
end