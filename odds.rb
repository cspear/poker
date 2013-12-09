require_relative 'hand'
require_relative 'deck'
require_relative 'card'


number_of_games_to_play = ARGV.first.to_f.to_s.to_i
puts number_of_games_to_play.class
puts number_of_games_to_play
count = 0

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

end