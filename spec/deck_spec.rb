require_relative '../deck'

describe "create deck" do

  @testdeck = Deck.new
  deck = @testdeck.create_deck

  it "should create 52 cards" do
    deck.count.should eql 52
  end

  it "should contain hearts" do
    deck.suite.count("hearts").should eql 1
  end

  it "should not contain other suites" do

  end


end

describe "empty?" do
end

describe "deck_size" do
end

describe "deal_card" do
end

