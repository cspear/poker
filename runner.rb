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
    current_rank = player_hand.rank_hand
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
  if ARGV.first == "--help"
    puts "poker.rb help"
    puts " "
    puts "if you want to evaluate a custom hand you must supply 5 cards in a"
    puts "format like this: <number><one-letter suit>.  for example: 5d 10h"
    puts "a for ace, k for king, q for queen, j for jack"
    puts " "
    puts "ruby runner.rb 5h 6h 7h 8h 9h"
    puts " "
  else
    argv_cards = []
    raise "wrong number of cards, only enter 5" unless ARGV.count == 5

    ARGV.each do |card|
      suit = card.byteslice(-1)
      if suit == "s" then suit = :spades   end
      if suit == "c" then suit = :clubs    end
      if suit == "h" then suit = :hearts   end
      if suit == "d" then suit = :diamonds end

      argv_number = card[0...-1]
      if argv_number == "a" then argv_number = "14" end
      if argv_number == "k" then argv_number = "13" end
      if argv_number == "q" then argv_number = "12" end
      if argv_number == "j" then argv_number = "11" end

      number = Card::NUMBERS[(argv_number.to_i - 2)]
      argv_cards << Card.new(number, suit)
    end
      argv_hand = Hand.new("-user inputed hand-", argv_cards)
      returned = argv_hand.rank_hand
  end
end



