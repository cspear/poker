require_relative '../deck'

describe "create deck" do
  before(:each) do
    @testdeck = Deck.new
  end

  it "should create 52 cards" do
    @testdeck.deck_size.should eql 52
  end

  it "should not be empty" do
    @testdeck.empty?.should eql false
  end
end

describe "empty?" do
  before(:each) do
    @testdeck = Deck.new
  end

  it "should not be empty" do
    @testdeck.empty?.should eql false
  end

  it "should be empty" do
    hand = @testdeck.deal_card(52)
    @testdeck.empty?.should eql true
  end
end

describe "deck_size" do
  before(:each) do
    @testdeck = Deck.new
  end

  it "should be size of 52" do
    @testdeck.deck_size.should eql 52
  end
end

describe "deal_card" do
  before(:each) do
    @testdeck = Deck.new
  end

  it "should deal 10 cards" do
    testhand = []
    testhand = @testdeck.deal_card(10)
    testhand.length.should eql 10
  end

  it "should deal 1 card by default" do
    testhand = []
    testhand = @testdeck.deal_card
    testhand.length.should eql 1
  end
end

