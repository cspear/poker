require_relative 'deck'

class Hand

  attr_reader :player_name


  def initialize(player_name, cards)
    @cards = cards
    @player_name = player_name
    sort!
  end

  def deal_cards(hand_size)
    @player_cards = []
    @player_cards = deck.deal_cards(hand_size)
  end

  def sort!
    @cards.sort_by! { |k| k.value }
  end

  def hand_numbers_only
    nums_only = []
      @cards.each do |e|
        nums_only << e.value
      end
    nums_only
  end

  def print_hand
    @cards.each do |card|
      puts "#{card.number}:#{card.suit}=#{card.value}"
    end
  end

  def flush?
    flush = false

    diamond_flush = true unless @cards.count{|card| card.diamonds?(card)} < 5
    club_flush    = true unless @cards.count{|card| card.clubs?(card)}    < 5
    heart_flush   = true unless @cards.count{|card| card.hearts?(card)}   < 5
    spade_flush   = true unless @cards.count{|card| card.spades?(card)}   < 5

    if diamond_flush or club_flush or heart_flush or spade_flush then flush = true end
    flush
  end

  def straight?
    straight = true

    @cards.each_cons(2) do |card1, card2|
      if card1.value + 1 == card2.value
        #good
      else
        straight = false
      end
    end

    straight
  end

  def am_i_multi_same
    nums_only = hand_numbers_only
    one_pair = nil
    two_pair = nil
    three_kind = nil
    four_kind = nil
    type = nil
    rank = nil

    # counts = nums_only.group_by{|i| i}.map{|k,v| [k, v.count] }
    # puts "counts are: #{counts}"

    Card::VALUES.each do |value|
      if nums_only.count(value) == 4 then
        rank = 8 and type = 'four of a kind'
      elsif nums_only.count(value) == 3 then
        rank = 4 and type = 'three of a kind'
        three_kind = true
      elsif nums_only.count(value) == 2 then
        if one_pair then
          two_pair = true
          rank = 3 and type = 'two pair'
          one_pair = false
        else
          one_pair = true
          rank = 2 and type = 'one pair'
        end
      end
    end

    if three_kind && one_pair then
      rank = 7 and type = 'full house'
    end

    return type, rank
  end

  def ace?
    @cards.any? { |card| card.ace?(card) }
  end

  def rank_hand
    ace_type = ace?
    straight = straight?
    flush_type = flush?

    if flush_type
      if straight
        if ace_type
          rank = 10 and type = 'royal flush'
        else
          rank = 9 and type = 'straight flush'
        end
      else
        rank = 6 and type = 'flush'
      end
    else
      returned = am_i_multi_same
      type = returned[0]
      rank = returned[1]
    end

    if straight && flush_type == false
      rank = 5 and type = 'straight'
    end

    if type == '' or type == nil
      rank = 0 and type = '-no rank-'
    end

    if type == '-no rank-' && ace_type
      rank = 1 and type = 'ace-high'
    end

    print_hand_rank(type)

    return rank, type
  end

  def print_hand_rank(type)
    print_hand = ""
    @cards.each do |ea|
      print_hand = print_hand + " #{ea.short_num}#{ea.short_suit}"
    end

    puts "#{@player_name}"
    puts print_hand
    puts "#{type}"
  end
end
