class Card

  SUITS          = [:spades, :clubs, :diamonds, :hearts]
  NUMBERS        = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  VALUES         = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  SHORT_NUMS     = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SHORT_SUITS    = [:S, :C, :D, :H]

  attr_reader :number, :suit, :value, :short_num, :short_suit

  def initialize(number, suit)
    raise "number < #{number} > is invalid" if !NUMBERS.include?(number)
    raise "suit < #{suit} > is invalid"     if !SUITS.include?(suit)

    @suit        = suit
    @number      = number
    @short_num   = SHORT_NUMS[NUMBERS.index(number)]
    @value       = VALUES[NUMBERS.index(number)]
    @short_suit  = SHORT_SUITS[SUITS.index(suit)]
  end

  def to_s
    "card: #{@short_num}#{@short_suit}"
  end

  def self.all_cards
    @cards = []
    SUITS.each do |suit|
      NUMBERS.each do |number|
        @cards << Card.new(number, suit)
      end
    end
    @cards
  end

  def ace?
    @number == :ace
  end

  def diamonds?
    @suit == :diamonds
  end

  def hearts?
    @suit == :hearts
  end

  def clubs?
    @suit == :clubs
  end

  def spades?
    @suit == :spades
  end
end
