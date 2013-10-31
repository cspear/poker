# poker_spec.rb.
# require 'spec_helper'
require_relative '../poker'

describe "create_deck" do

  @testpoker = Poker.new
  deck = @testpoker.create_deck

  it "should create 52 cards" do
    deck.count.should eql 52
  end

  it "should contain hearts" do
    deck[0][:suite].count("h").should eql 1
  end

end

# describe "deal_hands" do
#   @testpoker = Poker.new
#   deck = @testpoker.create_deck
# end

describe "is_straight" do

  before(:each) do
    # fixed_hand = []   ------- Why can't I put this here??
    @tp = Poker.new
  end

  it "should be a straight" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>1}]
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>3}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_straight(fixed_hand)

    test_hand.should eql true
  end

  it "should not be a straight" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>1}]
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_straight(fixed_hand)

    test_hand.should eql false
  end

end

describe "is_flushes" do

  before(:each) do
    @tp = Poker.new
  end

  it "should be a flush" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>1}]
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_flushes(fixed_hand, fixed_hand, false)

    test_hand.should eql "flush"
  end

  it "should be a royal flush" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>10}]
    fixed_hand << [{:suite=>"d", :number=>11}]
    fixed_hand << [{:suite=>"d", :number=>12}]
    fixed_hand << [{:suite=>"d", :number=>13}]
    fixed_hand << [{:suite=>"d", :number=>14}]
    test_hand = @tp.is_flushes(fixed_hand, fixed_hand, true)

    test_hand.should eql "royal flush"
  end

  it "should be a straight flush" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>6}]
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>3}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_flushes(fixed_hand, fixed_hand, true)

    test_hand.should eql "straight flush"
  end

  it "should not be a flush" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>1}]
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_flushes(fixed_hand, fixed_hand, false)

    test_hand.should eql nil
  end


end

describe "is_multi_same" do

  before(:each) do
    @tp = Poker.new
  end

  it "should be a pair" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"c", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>3}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_multi_same(fixed_hand)

    test_hand.should eql "one pair"
  end

  it "should be three of a kind" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"c", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_multi_same(fixed_hand)

    test_hand.should eql "three of a kind"
  end

  it "should be four of a kind" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"c", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_multi_same(fixed_hand)

    test_hand.should eql "four of a kind"
  end

  it "should be two pair" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"c", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>4}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_multi_same(fixed_hand)

    test_hand.should eql "two pair"
  end

  it "should be a full house" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"c", :number=>2}]
    fixed_hand << [{:suite=>"h", :number=>2}]
    fixed_hand << [{:suite=>"d", :number=>3}]
    fixed_hand << [{:suite=>"d", :number=>3}]
    test_hand = @tp.is_multi_same(fixed_hand)

    test_hand.should eql "full house"
  end

  it "should be none of these" do
    fixed_hand = []
    fixed_hand << [{:suite=>"d", :number=>2}]
    fixed_hand << [{:suite=>"c", :number=>9}]
    fixed_hand << [{:suite=>"h", :number=>3}]
    fixed_hand << [{:suite=>"d", :number=>11}]
    fixed_hand << [{:suite=>"d", :number=>5}]
    test_hand = @tp.is_multi_same(fixed_hand)

    test_hand.should eql nil
  end

end

describe "rank_cards" do

  before(:each) do
    @tp = Poker.new
  end

  it "should be -no rank-" do

  end


end




