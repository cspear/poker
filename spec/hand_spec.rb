require_relative '../hand'

describe "am_i_flush" do
  before(:each) do
    @testcards = []
  end

  it "should be a flush" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:three, :diamonds, 3, :D, '3')
    @testcards << Card.new(:four, :diamonds, 4, :D, '4')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:jack, :diamonds, 11, :D, 'J')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_flush.should eql true
  end

  it "should NOT be a flush" do
    @testcards << Card.new(:two, :hearts, 2, :D, '2')
    @testcards << Card.new(:three, :diamonds, 3, :D, '3')
    @testcards << Card.new(:four, :diamonds, 4, :D, '4')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:jack, :diamonds, 11, :D, 'J')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_flush.should eql false
  end
end

describe "am_i_a_straight" do
  before(:each) do
    @testcards = []
  end

  it "should be a straight" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:three, :clubs, 3, :C, '3')
    @testcards << Card.new(:four, :diamonds, 4, :D, '4')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:six, :diamonds, 6, :D, '6')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_a_straight.should eql true
  end

  it "should NOT be a straight" do
    @testcards << Card.new(:ace, :diamonds, 14, :D, '14')
    @testcards << Card.new(:three, :clubs, 3, :C, '3')
    @testcards << Card.new(:four, :diamonds, 4, :D, '4')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:six, :diamonds, 6, :D, '6')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_a_straight.should eql false
  end
end

describe "am_i_multi_same" do
  before(:each) do
    @testcards = []
  end

  it "should be ONE PAIR" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:two, :clubs, 2, :C, '2')
    @testcards << Card.new(:four, :diamonds, 4, :D, '4')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:eleven, :diamonds, 11, :D, '5')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_multi_same[0].should eql 'one pair'
  end

  it "should be a TWO PAIR" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:two, :clubs, 2, :C, '2')
    @testcards << Card.new(:three, :diamonds, 3, :D, '3')
    @testcards << Card.new(:three, :clubs, 3, :C, '3')
    @testcards << Card.new(:eleven, :diamonds, 11, :D, '11')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_multi_same[0].should eql 'two pair'
  end

  it "should be a THREE OF A KIND" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:two, :clubs, 2, :C, '2')
    @testcards << Card.new(:two, :hearts, 2, :H, '2')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:eleven, :diamonds, 11, :D, '11')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_multi_same[0].should eql 'three of a kind'
  end

  it "should be FOUR OF A KIND" do
    @testcards << Card.new(:nine, :diamonds, 9, :d, '9')
    @testcards << Card.new(:nine, :clubs, 9, :C, '9')
    @testcards << Card.new(:nine, :hearts, 9, :H, '9')
    @testcards << Card.new(:nine, :spades, 9, :S, '9')
    @testcards << Card.new(:eleven, :diamonds, 11, :D, '11')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_multi_same[0].should eql 'four of a kind'
  end

  it "should be FULL HOUSE" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:two, :clubs, 2, :C, '2')
    @testcards << Card.new(:three, :diamonds, 3, :D, '3')
    @testcards << Card.new(:three, :clubs, 3, :C, '3')
    @testcards << Card.new(:three, :hearts, 3, :H, '3')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_multi_same[0].should eql 'full house'
  end

  it "should NOT be a multi" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:three, :diamonds, 3, :D, '3')
    @testcards << Card.new(:four, :diamonds, 4, :D, '4')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:eleven, :diamonds, 11, :D, '11')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.am_i_multi_same[0].should eql nil
  end
end

describe "do_i_have_ace" do
  before(:each) do
    @testcards = []
  end

  it "should have an ACE" do
    @testcards << Card.new(:two, :diamonds, 2, :D, '2')
    @testcards << Card.new(:two, :clubs, 2, :C, '2')
    @testcards << Card.new(:four, :diamonds, 4, :D, '4')
    @testcards << Card.new(:five, :diamonds, 5, :D, '5')
    @testcards << Card.new(:ace, :diamonds, 14, :D, '14')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.do_i_have_ace.should eql true
  end
end

describe "rank_hand" do
  before(:each) do
    @testcards = []
  end

  it "should have be a ROYAL FLUSH" do
    @testcards << Card.new(:ace, :diamonds, 14, :D, '14')
    @testcards << Card.new(:king, :diamonds, 13, :D, '13')
    @testcards << Card.new(:queen, :diamonds, 12, :D, '12')
    @testcards << Card.new(:jack, :diamonds, 11, :D, '11')
    @testcards << Card.new(:ten, :diamonds, 10, :D, '10')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.rank_hand[1].should eql 'royal flush'
  end

  it "should have be a STRAIGHT FLUSH" do
    @testcards << Card.new(:nine, :diamonds, 9, :D, '9')
    @testcards << Card.new(:king, :diamonds, 13, :D, '13')
    @testcards << Card.new(:queen, :diamonds, 12, :D, '12')
    @testcards << Card.new(:jack, :diamonds, 11, :D, '11')
    @testcards << Card.new(:ten, :diamonds, 10, :D, '10')

    @testhand = Hand.new('testhand', @testcards)
    @testhand.rank_hand[1].should eql 'straight flush'
  end
end

