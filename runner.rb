# require 'sinatra'
require './poker'

# get '/' do



# end
@pk = Poker.new
decks = @pk.create_deck
@pk.shuffle_deck(decks)
my_hand = @pk.deal_hands(decks, 5)
# my_hand_sorted = @pk.sorted_hand(my_hand)

results = @pk.rank_cards(my_hand)