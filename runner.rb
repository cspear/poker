# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'

players = ['charlie', 'jeff', 'adam', 'bud']

players.each do |name|
  player_hand = Hand.new(name)
  results = player_hand.rank_hand
end




#next:
# 1. determine winner.  (rank the ranks)
# 2. clean up ranking, figure a better way to assess by looking at CARDS not HAND
# 3.
# 4.
# 5.