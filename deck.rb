require_relative 'card'

class Deck

  attr_accessor :deck

  def initialize
    @deck = []
    Card::SUITS.each do |suit|
      Card::NUMBERS.each_with_index do |number, value|
        value = value + 2
        @deck << Card.new(number, suit, value)
      end
    end
    @deck.shuffle!
  end

  def count_hearts
    puts @deck
    puts @deck.count(:hearts)
    puts @deck.count('2')
    @deck.count(:hearts)
  end

  def count_spades
    @deck.count(:spades)
  end

  def count_clubs
    @deck.count(:clubs)
  end

  def count_diamonds
    @deck.count(:diamonds)
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