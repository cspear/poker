# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'

@deck = Deck.new
# mydeck = @deck.create_deck

@hand = Hand.new

handone = @hand.deal_cards
handtwo = @hand.deal_cards
handthree = @hand.deal_cards

@hand.rank_hand(handone)
@hand.rank_hand(handtwo)
@hand.rank_hand(handthree)

