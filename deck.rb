require_relative 'card'

class Deck

  attr_accessor :deck

  def initialize
    @deck = []
    Card::SUITS.each_with_index do |suit, i_suit|
      Card::NUMBERS.each_with_index do |number, i_number|
        card_value = i_number + 2
        @deck << Card.new(number, suit, card_value, Card::SHORT_SUIT[i_suit], Card::SHORT_NUM[i_number])
      end
    end
    @deck.shuffle!
  end

  def empty?
    @deck.empty?
  end

  def deck_size
    @deck.length
  end

  def deal_card(number=1)
    @deck.pop(number)
  end

  def to_s
    "FROM DECK: #{card.number}:#{card.suit}=#{card.value}"
  end

  def print_deck(deck)
    deck.each do |card|
      puts "#{card.number}:#{card.suit}=#{card.value}"
    end
  end

end