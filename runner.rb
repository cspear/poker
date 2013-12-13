# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'

if ARGV.first == nil

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

else
  argv_cards = []

  ARGV.each do |card|
    suit = card.byteslice(-1)
    if suit == "s" then suit = :spades   end
    if suit == "c" then suit = :clubs    end
    if suit == "h" then suit = :hearts   end
    if suit == "d" then suit = :diamonds end
    argv_number = card[0...-1]

    argv_cards < Card.new(argv_number,suit)
  end
    argv_hand = Hand.new("self selected", argv_cards)
    returned = argv_hand.rank_hand
end

