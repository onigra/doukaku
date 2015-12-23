require "rspec"
require_relative "./tick_tack_toe"

describe TickTackToe do
  [
    [0, 79538246, "x won."],
    [1, 35497162193, "x won."],
    [2, 61978543, "x won."],
    [3, 254961323121, "x won."],
    [4, 6134278187, "x won."],
    [5, 4319581, "Foul : x won."],
    [6, 9625663381, "Foul : x won."],
    [7, 7975662, "Foul : x won."],
    [8, 2368799597, "Foul : x won."],
    [9, 18652368566, "Foul : x won."],
    [10, 965715, "o won."],
    [11, 38745796, "o won."],
    [12, 371929, "o won."],
    [13, 758698769, "o won."],
    [14, 42683953, "o won."],
    [15, 618843927, "Foul : o won."],
    [16, 36535224, "Foul : o won."],
    [17, 882973, "Foul : o won."],
    [18, 653675681, "Foul : o won."],
    [19, 9729934662, "Foul : o won."],
    [20, 972651483927, "Draw game."],
    [21, 5439126787, "Draw game."],
    [22, 142583697, "Draw game."],
    [23, 42198637563, "Draw game."],
    [24, 657391482, "Draw game."],
  ].each do |id, input, expected|
    describe "#run" do
      context input do
        subject { TickTackToe.new(input).run }
        it { should eq expected }
      end
    end
  end
end

