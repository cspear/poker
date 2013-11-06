require_relative 'card'

class Deck

  attr_accessor :deck

  def initialize
    []
    puts "[-created the deck-]"
    return @deck
  end

  def create_deck
    @deck = []
    # @hand = []
    Card::SUITES.each do |suite|
      Card::NUMBERS.each_with_index do |number, value|
        value = value + 2
        @deck << Card.new(number, suite, value)
      end
    end

    @deck.shuffle!
    print_deck(@deck)

    # @hand << @deck.pop(5)
    # print_deck(@hand)
    puts "[-created the deck-]"
    return @deck
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
    # "#{@deck}"
    "FROM DECK: #{card.number}:#{card.suite}=#{card.value}"
  end

  def print_deck(deck)
    deck.each do |card|
      puts "#{card.number}:#{card.suite}=#{card.value}"
    end
  end

# deck can only have 52 cards.
# deck can only contain cards.
# deck can not be 0 cards
#
end