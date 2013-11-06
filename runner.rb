# require 'sinatra'
# require_relative 'play_rank'
require_relative 'hand'
require_relative 'deck'


# second approach

@deck = Deck.new
mydeck = @deck.create_deck

@hand = Hand.new

handone = @hand.deal_cards(mydeck)
handtwo = @hand.deal_cards(mydeck)
handthree = @hand.deal_cards(mydeck)

@hand.rank_hand(handone)
@hand.rank_hand(handtwo)
@hand.rank_hand(handthree)




# puts "--HAND ONE--"
# puts handone
# puts "deck size: #{@deck.deck_size}"
# puts " "

# handtwo = @hand.deal_cards(mydeck)

# puts "--HAND TWO--"
# puts handtwo
# puts "deck size: #{@deck.deck_size}"
# puts " "

# handone_sorted = @hand.hand_sort(handone)
# puts handone_sorted
# handtwo_sorted = @hand.hand_sort(handtwo)
# puts handtwo_sorted

# handone_nums = @hand.hand_numbers_only(handone)
# puts "handone_num : #{handone_nums}"
# puts " "
# handtwo_nums = @hand.hand_numbers_only(handtwo)
# puts "handtwo_num : #{handtwo_nums}"

# straight_one = @hand.am_i_a_straight(handone_sorted)
# puts "straight? = #{straight_one}"
# straight_two = @hand.am_i_a_straight(handtwo_sorted)
# puts "straight? = #{straight_two}"

# flush_one = @hand.am_i_flush(handone)
# puts "flush? = #{flush_one}"
# flush_two = @hand.am_i_flush(handtwo)
# puts "flush? = #{flush_two}"

# ace_one = @hand.do_i_have_ace(handone)
# puts "ace? = #{ace_one}"
# ace_two = @hand.do_i_have_ace(handtwo)
# puts "ace? = #{ace_two}"

# multi_one = @hand.am_i_multi_same(handone_nums)
# puts "multi? = #{multi_one}"
# multi_two = @hand.am_i_multi_same(handtwo_nums)
# puts "multi? = #{multi_two}"


