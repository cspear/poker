class Card

  NUMBERS       = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  VALUES        = [2..14]
  SHORT_NUM     = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS         = [:spades, :clubs, :diamonds, :hearts]
  SHORT_SUIT    = [:S, :C, :D, :H]

  attr_reader :number, :suit, :value, :short_num, :short_suit

  def initialize(number, suit, value, short_suit, short_num)
    @number     = number
    @suit       = suit
    @value      = value
    @short_suit = short_suit
    @short_num  = short_num
  end

  def to_s
    "card: #{@short_num}#{@short_suit}"
  end  

  def self.all_cards
    @cards = []
    
    SUITS.each_with_index do |suit, i_suit|
      NUMBERS.each_with_index do |number, i_number|
        card_value = i_number + 2
        @cards << Card.new(number, suit, card_value, Card::SHORT_SUIT[i_suit], Card::SHORT_NUM[i_number])
      end
    end
    puts @cards
  end

end
