class Card

  SUITS          = [:spades, :clubs, :diamonds, :hearts]
  NUMBERS        = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  VALUES         = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  SHORT_NUMS     = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SHORT_SUITS    = [:S, :C, :D, :H]

  attr_reader :number, :suit, :value, :short_num, :short_suit

  def initialize(number, suit)
    if NUMBERS.include?(number) then @number = number else raise "number <#{number}> is invalid" end
    if SUITS.include?(suit)     then @suit = suit     else raise "suit <#{suit}> is invalid"     end

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

  def ace?(card)
    card.number == :ace
  end

  def diamonds?(card)
    card.suit == :diamonds
  end

  def hearts?(card)
    card.suit == :hearts
  end

  def clubs?(card)
    card.suit == :clubs
  end

  def spades?(card)
    card.suit == :spades
  end
end
