require_relative 'hand'
require_relative 'deck'
require_relative 'card'


number_of_games_to_play = ARGV.first.to_f.to_s.to_i
puts number_of_games_to_play.class
puts number_of_games_to_play
count = 0
winning_hands_rank = []
winners = []

number_of_games_to_play.times do
  count = count + 1
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
  puts "Hand: #{count} "
  puts "Congratulations: #{winner} (hand rank of: #{last_hand_rank})"

  winning_hands_rank[count] = last_hand_rank
  winners[count]            = winner

end

# winners.each_with_index do |winner, index|
#   puts "winners #{winner} of rank #{winning_hands_rank[index]}"
# end

rank_aggregation_by_type = []
rank_aggregation_by_type << ['royal flush', winning_hands_rank.count(10)]
rank_aggregation_by_type << ['straight flush', winning_hands_rank.count(9)]
rank_aggregation_by_type << ['four of a kind', winning_hands_rank.count(8)]
rank_aggregation_by_type << ['full house', winning_hands_rank.count(7)]
rank_aggregation_by_type << ['flush', winning_hands_rank.count(6)]
rank_aggregation_by_type << ['straight', winning_hands_rank.count(5)]
rank_aggregation_by_type << ['three of a kind', winning_hands_rank.count(4)]
rank_aggregation_by_type << ['two pair', winning_hands_rank.count(3)]
rank_aggregation_by_type << ['one pair', winning_hands_rank.count(2)]
rank_aggregation_by_type << ['ace-high', winning_hands_rank.count(1)]
rank_aggregation_by_type << ['-no rank-', winning_hands_rank.count(0)]

puts "===================================="
rank_aggregation_by_type.each do |each|
  puts each.join(' - ')
end
puts "===================================="