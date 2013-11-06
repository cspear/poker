require_relative 'hand'

class Play_rank

  def initialize
    # @hand = Hand.new
    # puts "hand array?: #{@hand.kind_of?(Array)}"
  end

  def is_straight(hand)
    straight = false
      sorted_hand = []
      hand.each do |card|
        sorted_hand << card.value
      end

      sorted_hand = sorted_hand.sort_by {|k| k[:number]}


      if sorted_hand[0][:number].to_i + 1 == sorted_hand[1][:number].to_i then
        if sorted_hand[1][:number].to_i + 1 == sorted_hand[2][:number].to_i then
          if sorted_hand[2][:number].to_i + 1 == sorted_hand[3][:number].to_i then
            if sorted_hand[3][:number].to_i + 1 == sorted_hand[4][:number].to_i then
              straight = true
            end
          end
        end
      end
      return straight
    end

  def is_flushes(hand, is_it_straight)
    if hand[0][:suite] == hand[1][:suite] then
      if hand[1][:suite] == hand[2][:suite] then
        if hand[2][:suite] == hand[3][:suite] then
          if hand[3][:suite] == hand[4][:suite] then

            rank = 'flush'

            if is_it_straight == true then
              if hand[4][:number] == :ace then
                rank = 'royal flush'
              else
                rank = 'straight flush'
              end
            end
          end
        end
      end
    end
    return rank
  end

  def is_multi_same(hand)
    one_pair = nil
    two_pair = nil
    three_kind = nil
    four_kind = nil
    type = nil
    num = nil


    num_hand = []
    hand.each do |num|
      num_hand << num[:number]
    end

    (1..13).each do |num|

      if num_hand.count(num) == 4 then
        type = 'four of a kind'
      elsif num_hand.count(num) == 3 then
        type = 'three of a kind'
        three_kind = true
      elsif num_hand.count(num) == 2 then
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
    return type
  end

  def print_hand_rank(hand, rank)
    printed = "hand: "
    hand.each do |num|
      if num[0][:number] == 14 then num[0][:number] = 'A' end
      if num[0][:number] == 13 then num[0][:number] = 'K' end
      if num[0][:number] == 12 then num[0][:number] = 'Q' end
      if num[0][:number] == 11 then num[0][:number] = 'J' end

      printed = printed + "#{num[0][:number]}#{num[0][:suite]} "
    end
    puts " "
    puts printed

    puts rank
    # puts " "
  end

  def rank_cards(hand)
    done = false

    straight = is_straight(hand)
    if straight then type = 'straight' end

    flush_type = is_flushes(hand, straight)

    if flush_type == 'flush' || flush_type == 'royal flush' || flush_type == 'straight flush'
      type = flush_type
      done = true
    else
      type = is_multi_same(hand)
    end

    if straight && flush_type == nil then type = 'straight' end
    if type == '' then type = '-no rank-' end
    if type == nil then type = '-no rank-' end

    print_hand_rank(hand, type)
    end
end
