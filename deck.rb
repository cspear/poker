require_relative 'card'

class Deck

  attr_accessor :deck

  def initialize
    []
    return @deck
  end

  def create_deck
    @deck = []
    Card::SUITES.each do |suite|
      Card::NUMBERS.each_with_index do |number, value|
        value = value + 2
        @deck << Card.new(number, suite, value)
      end
    end

    @deck.shuffle!

    return @deck
  end

  def empty?
    @deck.empty?
  end

  def deck_size
    @deck.length
  end

  # def deal_card(number=1)
  #   @deck.pop(number)
  # end

  def to_s
    "FROM DECK: #{card.number}:#{card.suite}=#{card.value}"
  end

  def print_deck(deck)
    deck.each do |card|
      puts "#{card.number}:#{card.suite}=#{card.value}"
    end
  end

end