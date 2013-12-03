# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'

hand_size = 5

the_deck = Deck.new(Card.all_cards)
p the_deck



# if Deck is a deck and not an array, how do I manipulate the card objects in the deck object.

players = ['charlie', 'jeff', 'adam', 'bud']

players.each do |name|
  player_cards = []
  player_cards = the_deck.deal_cards(5)
  player_hand = Hand.new(player_cards)
  results = player_hand.rank_hand
end




#next:
# 1. determine winner.  (rank the ranks)
# 2. clean up ranking, figure a better way to assess by looking at CARDS not HAND
# 3.
# 4.
# 5.