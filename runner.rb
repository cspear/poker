# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'

@hand = Hand.new

results = @hand.rank_hand

puts results


