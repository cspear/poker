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
    puts " "
    puts "  poker.rb help"
    puts " "
    puts "  if you want to evaluate a custom hand you must supply 5 cards in a"
    puts "  format like this: <number><one-letter suit>.  for example: 5d 10h 8s 3c 3h"
    puts "  a for ace, k for king, q for queen, j for jack"
    puts " "
    puts "  ruby runner.rb 5h 6h 7h 8h 9h"
    puts " "
  else
    argv_cards = []
    raise "  wrong number of cards, enter 5 card.  see '--help' for more information." unless ARGV.count == 5

    ARGV.each do |card|
      argv_suit = card.byteslice(-1)
      if argv_suit == "s" then suit = :spades   end
      if argv_suit == "c" then suit = :clubs    end
      if argv_suit == "h" then suit = :hearts   end
      if argv_suit == "d" then suit = :diamonds end


#another way
      # argv_suit = card.byteslice(-1)
      # suits = {'s' => :spades, 'c' => :clubs, 'h' => :hearts, 'd' => diamonds}
      # suits.each do |card, value|
        #   if argv_suit == card then argv_suit = value end
        # end

      argv_number = card[0...-1]
      if argv_number == "a" then argv_number = "14" end
      if argv_number == "k" then argv_number = "13" end
      if argv_number == "q" then argv_number = "12" end
      if argv_number == "j" then argv_number = "11" end

#another way (same # lines.)
      # argv_number = card[0..-1]
      # face_cards = {'a' => '14', 'k' => '13', 'q' => '12', 'j' => '11'}
      # face_cards.each do |card, value|
      #   if argv_number == card then argv_number = value end
      # end

#combined:
      #special_cards = {'s' => :spades, 'c' => :clubs, 'h' => :hearts, 'd' => diamonds,'a' => '14', 'k' => '13', 'q' => '12', 'j' => '11'}
      #argv_suit   = card.byteslice(-1)
      #argv_number = card[0...-1]
      #special_cards.each do |card, value|
      #   if argv_number == card then argv_number = value end
      #   if argv_suit   == card then argv_suit   = value end
      #end

      number = Card::NUMBERS[(argv_number.to_i - 2)]
      argv_cards << Card.new(number, suit)
    end
      argv_hand = Hand.new("-user inputed hand-", argv_cards)
      returned = argv_hand.rank_hand
  end
end



