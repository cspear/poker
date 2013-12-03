require_relative '../hand'


# describe "deal_cards" do
# end

# describe "hand_sort" do
# end

# describe "hand_numbers_only" do
# end

# describe "hand_suites_only" do
# end

describe "am_i_flush" do
  before(:each) do
    @testhand = Hand.new('testuser', 0)
    @testhand.print_hand
  end

  it "should be a flush" do
    # ?? WHY can't I add Card objects here like I do in the code??
    puts Card.new(:two, :diamonds, 2, :D, '2')

    @testhand << Card.new(:two, :diamonds, 2, :D, '2')
    @testhand.print_hand
    @testhand << Card.new(:three, :diamonds, 3, :D, '3')
    @testhand << Card.new(:four, :diamonds, 4, :D, '4')
    @testhand << Card.new(:five, :diamonds, 5, :D, '5')
    @testhand << Card.new(:jack, :diamonds, 11, :D, 'J')

    @testhand.am_i_flush.should eql true
  end
end

describe "am_i_a_straight" do
  before(:each) do
    @testhand = Hand.new('testuser', 0)
  end

  it "should be a straight" do
    @testhand << Card.new(:two, :diamonds, 2)
    @testhand << Card.new(:three, :clubs, 3)
    @testhand << Card.new(:four, :diamonds, 4)
    @testhand << Card.new(:five, :diamonds, 5)
    @testhand << Card.new(:six, :diamonds, 6)

    @hand.am_i_a_straight(@testhand).should eql true
  end
end

describe "am_i_multi_same" do
  before(:each) do
    @testhand = Hand.new('testuser', 0)
  end

  it "should be ONE PAIR" do
    @testhand << Card.new(:two, :diamonds, 2)
    @testhand << Card.new(:two, :clubs, 2)
    @testhand << Card.new(:four, :diamonds, 4)
    @testhand << Card.new(:five, :diamonds, 5)
    @testhand << Card.new(:eleven, :diamonds, 11)

    @hand.am_i_multi_same(@testhand).should eql 'one pair'
  end

  it "should be a TWO PAIR" do
    @testhand << Card.new(:two, :diamonds, 2)
    @testhand << Card.new(:two, :clubs, 2)
    @testhand << Card.new(:three, :diamonds, 3)
    @testhand << Card.new(:three, :clubs, 3)
    @testhand << Card.new(:eleven, :diamonds, 11)

    @hand.am_i_multi_same(@testhand).should eql 'two pair'
  end

  it "should be a THREE OF A KIND" do
    @testhand << Card.new(:two, :diamonds, 2)
    @testhand << Card.new(:two, :clubs, 2)
    @testhand << Card.new(:two, :hearts, 2)
    @testhand << Card.new(:five, :diamonds, 5)
    @testhand << Card.new(:eleven, :diamonds, 11)

    @hand.am_i_multi_same(@testhand).should eql 'three of a kind'
  end

  it "should be FOUR OF A KIND" do
    @testhand << Card.new(:nine, :diamonds, 9)
    @testhand << Card.new(:nine, :clubs, 9)
    @testhand << Card.new(:nine, :hearts, 9)
    @testhand << Card.new(:nine, :spades, 9)
    @testhand << Card.new(:eleven, :diamonds, 11)

    test_hand = @hand.am_i_multi_same(@testhand)

    test_hand.should eql 'four of a kind'
  end

  it "should be FULL HOUSE" do
    @testhand << Card.new(:two, :diamonds, 2)
    @testhand << Card.new(:two, :clubs, 2)
    @testhand << Card.new(:three, :diamonds, 3)
    @testhand << Card.new(:three, :clubs, 3)
    @testhand << Card.new(:three, :hearts, 3)

    test_hand = @hand.am_i_multi_same(@testhand)

    test_hand.should eql 'full house'
  end

  it "should NOT be a multi" do
    @testhand << Card.new(:two, :diamonds, 2)
    @testhand << Card.new(:three, :diamonds, 3)
    @testhand << Card.new(:four, :diamonds, 4)
    @testhand << Card.new(:five, :diamonds, 5)
    @testhand << Card.new(:eleven, :diamonds, 11)

    test_hand = @hand.am_i_multi_same(@testhand)

    test_hand.should eql nil
  end
end

describe "do_i_have_ace" do
  before(:each) do
    @hand = Hand.new
  end

  it "should have an ACE" do
    @testhand << Card.new(:two, :diamonds, 2)
    @testhand << Card.new(:two, :clubs, 2)
    @testhand << Card.new(:four, :diamonds, 4)
    @testhand << Card.new(:five, :diamonds, 5)
    @testhand << Card.new(:ace, :diamonds, 14)

    @hand.do_i_have_ace(@testhand).should eql true
  end
end

describe "rank_hand" do
  before(:each) do
    @hand = Hand.new
  end

  it "should have be a ROYAL FLUSH" do
    @testhand = []
    @testhand << Card.new(:ace, :diamonds, 14)
    @testhand << Card.new(:king, :diamonds, 13)
    @testhand << Card.new(:queen, :diamonds, 12)
    @testhand << Card.new(:jack, :diamonds, 11)
    @testhand << Card.new(:ten, :diamonds, 10)

    @hand.rank_hand(@testhand).should eql 'royal flush'
  end

  it "should have be a STRAIGHT FLUSH" do
    @testhand = []
    @testhand << Card.new(:nine, :diamonds, 9)
    @testhand << Card.new(:king, :diamonds, 13)
    @testhand << Card.new(:queen, :diamonds, 12)
    @testhand << Card.new(:jack, :diamonds, 11)
    @testhand << Card.new(:ten, :diamonds, 10)

    @hand.rank_hand(@testhand).should eql 'straight flush'
  end
end

