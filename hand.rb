# require 'rubygems'
# require 'logger'

# Poker
#
# evaluate hands and rank them.

# create card
require_relative 'deck'


#remove "(hand)" items on the end of the methods.
class Hand

  attr_accessor :hand

  def initialize
    @hand = hand
    #empty hand
  end

  def deal_cards(deck, number=5)
    deck.pop(number)
  end

  def to_s
    "FROM HAND: #{card.number}:#{card.suite}=#{card.value}"
  end

  def hand_sort(hand)
    hand.sort_by {|k| k.value}
  end

  def hand_numbers_only(hand)
    nums_only = []
      hand.each do |e|
        nums_only << e.value
      end

    nums_only
  end

  def hand_suites_only
    suites_only = []
      hand.each do |e|
        suites_only << e.suite
      end

    nums_only
  end

  def print_hand
    @hand.each do |card|
      puts "#{card.number}:#{card.suite}=#{card.value}"
    end
  end

  def hand_cards_count
    @hand.length
  end

  def am_i_flush(hand)
    d = 0
    s = 0
    c = 0
    h = 0
    flush = false

    hand.each do |e|
      if e.suite == :diamonds then d = d + 1 end
      if e.suite == :spades   then s = s + 1 end
      if e.suite == :clubs    then c = c + 1 end
      if e.suite == :hearts   then h = h + 1 end
    end

    if d == 5 then flush = true end
    if s == 5 then flush = true end
    if c == 5 then flush = true end
    if h == 5 then flush = true end

    flush
  end

  def am_i_a_straight(hand)

    value_sorted = hand_sort(hand)

    count_hits = 0
    straight = false
    previous = 0
    index = 0
    value_sorted.each do |num|

      if index == 0
        previous = num.value
      else
        if num.value == previous + 1
          count_hits = count_hits + 1
        else
          straight = false
        end
      end
      index = index + 1
      previous = num.value
    end

    if count_hits == 4 then straight = true end

    straight
  end

  def am_i_multi_same(hand)
    nums_only = hand_numbers_only(hand)
    one_pair = nil
    two_pair = nil
    three_kind = nil
    four_kind = nil
    type = nil

    (1..13).each do |ea|
      if nums_only.count(ea) == 4 then
        type = 'four of a kind'
      elsif nums_only.count(ea) == 3 then
        type = 'three of a kind'
        three_kind = true
      elsif nums_only.count(ea) == 2 then
        if one_pair == true then
          two_pair = true
          one_pair = false
        else
          one_pair = true
        end
      end
    end

    if one_pair then type = 'one pair' end
    if two_pair then type = 'two pair' end

    if three_kind && one_pair then
      type = 'full house'
    end

    type
  end

  def do_i_have_ace(hand)
    ace = false
    hand.each do |ea|
      if ea.value == 14 then ace = true end
    end

    ace
  end

  def rank_hand(hand)
    done = false

    ace_type = do_i_have_ace(hand)

    straight = am_i_a_straight(hand)
    if straight then type = 'straight' end

    flush_type = am_i_flush(hand)

    if flush_type
      if straight
        if ace_type
          type = 'royal flush'
        else
          type = 'straight flush'
        end
      else
        type = 'flush'
      end
    else
      type = am_i_multi_same(hand)
    end

    if straight && flush_type == nil then type = 'straight' end
    if type == '' then type = '-no rank-' end
    if type == nil then type = '-no rank-' end
    if type == '-no rank-' && ace_type == true then type = 'ace-high' end

    print_hand_rank(hand, type)
    type
  end

  def print_hand_rank(hand, rank)

    print_hand = "HAND: "
    hand.each do |ea|
      print_hand = print_hand + " #{ea.number}-#{ea.suite}"
    end

    puts "------------------------------ "
    puts print_hand
    puts "RANK:  #{rank}"
    puts "------------------------------ "
  end
end
