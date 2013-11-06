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
    @fixed_hand = []
    @th = Hand.new
  end

  it "should be a flush" do
    ## need to pass in an object!!  unsure how to recreate for testing.
    # @fixed_hand << [{:suite=>"diamonds", :number=>1}]
    # @fixed_hand << [{:suite=>"diamonds", :number=>2}]
    # @fixed_hand << [{:suite=>"diamonds", :number=>2}]
    # @fixed_hand << [{:suite=>"diamonds", :number=>4}]
    # @fixed_hand << [{:suite=>"diamonds", :number=>5}]
    test_hand = @th.am_i_flush(@fixed_hand)

    test_hand.should eql true
  end
end

# describe "am_i_a_straight" do
# end

# describe "am_i_multi_same" do
# end

# describe "do_i_have_ace" do
# end

# describe "rank_hand" do
# end

