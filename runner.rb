# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'

@deck = Deck.new
# mydeck = @deck.create_deck

@hand = Hand.new

@deck.deal_card
# handtwo = @deck.deal_card
# handthree = @deck.deal_card

@hand.rank_hand
# @hand.rank_hand(handtwo)
# @hand.rank_hand(handthree)

