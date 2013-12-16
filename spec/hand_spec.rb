require_relative '../hand'

describe "flush?" do
  before(:each) do
    @testcards = []
  end

  it "should be a flush" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:three, :diamonds)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:jack, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.flush?.should eql true
  end

  it "should NOT be a flush" do
    @testcards << Card.new(:two, :hearts)
    @testcards << Card.new(:three, :diamonds)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:jack, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.flush?.should eql nil
  end
end

describe "straight?" do
  before(:each) do
    @testcards = []
  end

  it "should be a straight" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:three, :clubs)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:six, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.straight?.should eql true
  end

  it "should also be a straight" do
    @testcards << Card.new(:six, :diamonds)
    @testcards << Card.new(:three, :clubs)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:two, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.straight?.should eql true
  end

  it "should NOT be a straight" do
    @testcards << Card.new(:ace, :diamonds)
    @testcards << Card.new(:three, :clubs)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:six, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.straight?.should eql false
  end
end

describe "multiple_type" do
  before(:each) do
    @testcards = []
  end

  it "should be ONE PAIR" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:two, :clubs)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:jack, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.multiple_type.should eql 2
  end

  it "should be a TWO PAIR" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:two, :clubs)
    @testcards << Card.new(:three, :diamonds)
    @testcards << Card.new(:three, :clubs)
    @testcards << Card.new(:jack, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.multiple_type.should eql 3
  end

  it "should be a THREE OF A KIND" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:two, :clubs)
    @testcards << Card.new(:two, :hearts)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:jack, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.multiple_type.should eql 4
  end

  it "should be FOUR OF A KIND" do
    @testcards << Card.new(:nine, :diamonds)
    @testcards << Card.new(:nine, :clubs)
    @testcards << Card.new(:nine, :hearts)
    @testcards << Card.new(:nine, :spades)
    @testcards << Card.new(:jack, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.multiple_type.should eql 8
  end

  it "should be FULL HOUSE" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:two, :clubs)
    @testcards << Card.new(:three, :diamonds)
    @testcards << Card.new(:three, :clubs)
    @testcards << Card.new(:three, :hearts)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.multiple_type.should eql 7
  end

  it "should NOT be a multi" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:three, :diamonds)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:jack, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.multiple_type.should eql nil
  end
end

describe "ace?" do
  before(:each) do
    @testcards = []
  end

  it "should have an ACE" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:two, :clubs)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:ace, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.have_ace?.should eql true
  end

  it "should NOT have an ACE" do
    @testcards << Card.new(:two, :diamonds)
    @testcards << Card.new(:two, :clubs)
    @testcards << Card.new(:four, :diamonds)
    @testcards << Card.new(:five, :diamonds)
    @testcards << Card.new(:six, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.have_ace?.should eql false
  end


end

describe "rank_hand" do
  before(:each) do
    @testcards = []
  end

  it "should have be a ROYAL FLUSH" do
    @testcards << Card.new(:ace, :diamonds)
    @testcards << Card.new(:king, :diamonds)
    @testcards << Card.new(:queen, :diamonds)
    @testcards << Card.new(:jack, :diamonds)
    @testcards << Card.new(:ten, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.rank_hand.should eql 10
  end

  it "should have be a STRAIGHT FLUSH" do
    @testcards << Card.new(:nine, :diamonds)
    @testcards << Card.new(:king, :diamonds)
    @testcards << Card.new(:queen, :diamonds)
    @testcards << Card.new(:jack, :diamonds)
    @testcards << Card.new(:ten, :diamonds)

    @testhand = Hand.new('testhand', @testcards)
    @testhand.rank_hand.should eql 9
  end
end

# describe "test counting cards" do
#   before(:each) do
#     @testcards = []
#   end

#   it "test 1" do
#     @testcards << Card.new(:ace, :diamonds)
#     @testcards << Card.new(:king, :diamonds)
#     @testcards << Card.new(:queen, :diamonds)
#     @testcards << Card.new(:jack, :diamonds)
#     @testcards << Card.new(:ten, :diamonds)

#     @testhand = Hand.new('testhand', @testcards)
#     @testhand.count_hearts.should eql 0
#   end

#   it "test 2" do
#     @testcards << Card.new(:nine, :diamonds)
#     @testcards << Card.new(:king, :diamonds)
#     @testcards << Card.new(:queen, :diamonds)
#     @testcards << Card.new(:jack, :diamonds)
#     @testcards << Card.new(:ten, :diamonds)

#     @testhand = Hand.new('testhand', @testcards)
#     @testhand.count_diamonds.should eql 5
#   end
# end
