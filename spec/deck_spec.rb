require_relative '../deck'

describe "create deck" do
  before(:each) do
    @testdeck = Deck.new
    @deck = @testdeck.create_deck
    # puts "<< deck >> #{@deck}"
    # puts "<< testdeck >> #{@testdeck}"
  end

  it "should create 52 cards" do
    @deck.count.should eql 52
  end

  it "should contain hearts" do
    @deck.count(:hearts).should eql 1
    #how do I get at each, to see if I have a ea.suite == 'hearts'
  end

  it "should not contain other suites" do

  end
end

describe "empty?" do
  before(:each) do
    @testdeck = Deck.new
    @deck = @testdeck.create_deck
  end

  it "should not be empty" do
    @deck.empty?.should eql false
  end

  it "should be empty" do
    @testdeck.empty?.should eql true
    # unsure why this is failing.   does initialize of [] make it not empty?
  end
end

describe "deck_size" do
  before(:each) do
    @testdeck = Deck.new
    @deck = @testdeck.create_deck
  end

# remove, do I need to know the size of the deck?
  it "should be size of 52" do
    @deck.deck_size.should eql 52
  end
end

describe "deal_card" do
end

