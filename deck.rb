require_relative 'card'

class Deck

  def initialize(cards)
    @cards = cards
    @cards.shuffle!
  end

  def empty?
    @cards.empty?
  end

  def deck_size
    @cards.length
  end

  def deal_cards(number=1)
    @cards.pop(number)
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