# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'

the_deck = Deck.new(Card.all_cards)

players = ['Charlie', 'Jeff', 'Adam', 'Foo', 'Bar', 'Maggie']
last_hand_rank = 0
winner = 'nobody'

players.each do |name|
  puts ' '
  each_player_cards = []
  each_player_cards = the_deck.deal_cards(5)
  player_hand = Hand.new(name, each_player_cards)
  returned = player_hand.rank_hand
  current_rank = returned[0]
  if current_rank > last_hand_rank
    winner = name
    last_hand_rank = current_rank
  elsif current_rank == last_hand_rank
    winner = winner + ' and ' + name
    last_hand_rank = current_rank
  end

end
puts " "
puts "Congratulations: #{winner} (hand rank of: #{last_hand_rank})"


puts " "
# puts " "
# test = Card.new(:joker, :diamonds)

