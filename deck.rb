require_relative 'card'

class Deck

  attr_reader :cards


  def initialize(cards)
    @cards = cards
    puts @cards
  end

  def shuffle!
    @deck.shuffle!
  end

  def empty?
    @deck.empty?
  end

  def deck_size
    @deck.length
  end

  def deal_cards(number=1)
    @deck.pop(number)

    # @deck.each do |card|
    #   p card
    # end
  
  end

  # def to_s
  #   "FROM DECK: #{card.number}:#{card.suit}=#{card.value}"
  # end

  def print_deck(deck)
    deck.each do |card|
      puts "#{card.number}:#{card.suit}=#{card.value}"
    end
  end

end