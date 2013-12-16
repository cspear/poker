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
    diamond_flush = true unless @cards.count{|card| card.diamonds?} < 5
    club_flush    = true unless @cards.count{|card| card.clubs?}    < 5
    heart_flush   = true unless @cards.count{|card| card.hearts?}   < 5
    spade_flush   = true unless @cards.count{|card| card.spades?}   < 5

    diamond_flush or club_flush or heart_flush or spade_flush
  end

  def straight?
    @cards.each_cons(2) do |card1, card2|
      return false if card1.value + 1 != card2.value
    end

    true
  end

  def multiple_type
    nums_only = hand_numbers_only
    one_pair = nil
    two_pair = nil
    three_kind = nil
    four_kind = nil
    rank = nil

    # counts = nums_only.group_by{|i| i}.map{|k,v| [k, v.count] }
    # puts "counts are: #{counts}"

    Card::VALUES.each do |value|
      if nums_only.count(value) == 4 then
        rank = 8
      elsif nums_only.count(value) == 3 then
        rank = 4
        three_kind = true
      elsif nums_only.count(value) == 2 then
        if one_pair then
          two_pair = true
          rank = 3
          one_pair = false
        else
          one_pair = true
          rank = 2
        end
      end
    end

    if three_kind && one_pair then
      rank = 7
    end

    return rank
  end

  def have_ace?
    @cards.any? { |card| card.ace? }
  end

  def rank_hand
    rank = 0
    has_ace = have_ace?
    is_straight = straight?
    is_flush = flush?

    if is_flush
      if is_straight
        if has_ace
          rank = 10
        else
          rank = 9
        end
      else
        rank = 6
      end
    else
      rank = multiple_type
    end

    if rank == 0 && has_ace
      rank = 1
    end

    if rank == nil
      rank = 0
    end

    if is_straight && is_flush == false
      rank = 5
    end

    print_hand_rank(rank)

    return rank
  end

  def print_hand_rank(print_rank)
    print_hand = ""
    @cards.each do |ea|
      print_hand = print_hand + " #{ea.short_num}#{ea.short_suit}"
    end

    puts "#{@player_name}"
    puts print_hand
    rank_in_text = rank_to_text(print_rank)
    puts "#{rank_in_text}"
  end

  def rank_to_text(preTextRank)
    case preTextRank
      when 0 then "-no rank-"
      when 1 then "ace-high"
      when 2 then "one pair"
      when 3 then "two pair"
      when 4 then "three of a kind"
      when 5 then "straight"
      when 6 then "flush"
      when 7 then "full house"
      when 8 then "four of a kind"
      when 9 then "straight flush"
      when 10 then "royal flush"
      else
        "-ERROR-"
    end
  end
end
