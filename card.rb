class Card

  NUMBERS        = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  VALUES         = [2..14]
  SHORT_NUMS     = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS          = [:spades, :clubs, :diamonds, :hearts]
  SHORT_SUITS    = [:S, :C, :D, :H]

  attr_reader :number, :suit, :value, :short_num, :short_suit

  def initialize(number, suit, value, short_suit, short_num)
    card_invalid = false
    if NUMBERS.include?(number)         then @number = number         else card_invalid = true end
    # if VALUES.include?(value)           then @value = value           else card_invalid = true end
    @value = value
    if SHORT_NUMS.include?(short_num)   then @short_num = short_num   else card_invalid = true end
    if SUITS.include?(suit)             then @suit = suit             else card_invalid = true end
    if SHORT_SUITS.include?(short_suit) then @short_suit = short_suit else card_invalid = true end

    if card_invalid == true
      puts "card invalid: #{number}, #{suit}, #{value}, #{short_suit}, #{short_num}"
      raise
    end
  end

  def to_s
    "card: #{@short_num}#{@short_suit}"
  end

  def self.all_cards
    @cards = []

    SUITS.each_with_index do |suit, i_suit|
      NUMBERS.each_with_index do |number, i_number|
        card_value = i_number + 2
        @cards << Card.new(number, suit, card_value, Card::SHORT_SUITS[i_suit], Card::SHORT_NUMS[i_number])
      end
    end
    @cards
  end

  def is_card_valid?
    valid = true
    if NUMBERS.include?(@number)        then bob = 1 else valid = false end
    # if VALUES.include?(@value)          then bob = 1 else valid = false end
    if SHORT_NUM.include?(@short_num)   then bob = 1 else valid = false end
    if SUITS.include?(@suit)            then bob = 1 else valid = false end
    if SHORT_SUIT.include?(@short_suit) then bob = 1 else valid = false end
  end
end
