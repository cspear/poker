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

  def hand_suits_only
    suits_only = []
      @cards.each do |e|
        suits_only << e.suit
      end

    nums_only
  end

  def print_hand
    @cards.each do |card|
      puts "#{card.number}:#{card.suit}=#{card.value}"
    end
  end

  def hand_cards_count
    @cards.length
  end

  def am_i_flush
    #need to ask the card what suit it is.
    d = 0
    s = 0
    c = 0
    h = 0
    flush = false

    @cards.each do |e|
      if e.suit == :diamonds then d = d + 1 end
      if e.suit == :spades   then s = s + 1 end
      if e.suit == :clubs    then c = c + 1 end
      if e.suit == :hearts   then h = h + 1 end
    end

    if d == 5 then flush = true end
    if s == 5 then flush = true end
    if c == 5 then flush = true end
    if h == 5 then flush = true end

    flush
  end

  def am_i_a_straight
    count_hits = 0
    straight = false
    previous = 0
    index = 0
    @cards.each do |num|

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

  def am_i_multi_same
    nums_only = hand_numbers_only
    one_pair = nil
    two_pair = nil
    three_kind = nil
    four_kind = nil
    type = nil
    rank = nil

    (1..13).each do |ea|
      if nums_only.count(ea) == 4 then
        type = 'four of a kind'
        rank = 8
      elsif nums_only.count(ea) == 3 then
        type = 'three of a kind'
        three_kind = true
        rank = 4
      elsif nums_only.count(ea) == 2 then
        if one_pair == true then
          two_pair = true
          one_pair = false
        else
          one_pair = true
        end
      end
    end

    if one_pair
      type = 'one pair'
      rank = 2
    end

    if two_pair
      type = 'two pair'
      rank = 3
    end

    if three_kind && one_pair then
      type = 'full house'
      rank = 7
    end

    return type, rank
  end

  def do_i_have_ace
    ace = false
    @cards.each do |ea|
      if ea.value == 14 then ace = true end
    end
    ace
  end

  def rank_hand
    done = false

    ace_type = do_i_have_ace
    straight = am_i_a_straight

    if straight then type = 'straight' end

    flush_type = am_i_flush

    if flush_type
      if straight
        if ace_type
          type = 'royal flush'
          rank = 10
        else
          type = 'straight flush'
          rank = 9
        end
      else
        type = 'flush'
        rank = 6
      end
    else
      returned = am_i_multi_same
      type = returned[0]
      rank = returned[1]
    end

    if straight && flush_type == nil
      type = 'straight'
      rank = 5
    end

    if type == ''
      type = '-no rank-'
      rank = 0
    end
    if type == nil
      type = '-no rank-'
      rank = 0
    end

    if type == '-no rank-' && ace_type == true
      type = 'ace-high'
      rank = 1
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

  def count_hearts
    @cards.count(:hearts)
  end

  def count_spades
    @cards.count(:spades)
  end

  def count_clubs
    @cards.count(:clubs)
  end

  def count_diamonds
    @cards.count(:diamonds)
  end
end
