require "rspec"
require_relative "./nichigazo"

describe Nichigazo do
  [
    [ 1, "3:5b8", "3:de0" ],
    [ 2, "1:8", "1:8" ],
    [ 3, "2:8", "2:4" ],
    [ 4, "2:4", "2:1" ],
    [ 5, "2:1", "2:2" ],
    [ 6, "3:5d0", "3:5d0" ],
    [ 7, "4:1234", "4:0865" ],
    [ 8, "5:22a2a20", "5:22a2a20" ],
    [ 9, "5:1234567", "5:25b0540" ],
    [ 10, "6:123456789", "6:09cc196a6" ],
    [ 11, "7:123456789abcd", "7:f1a206734b258" ],
    [ 12, "7:fffffffffffff", "7:ffffffffffff8" ],
    [ 13, "7:fdfbf7efdfbf0", "7:ffffffffffc00" ],
    [ 14, "8:123456789abcdef1", "8:f0ccaaff78665580" ],
    [ 15, "9:112233445566778899aab", "9:b23da9011d22daf005d40" ],
  ].each do |id, input, expected|
    describe "#run" do
      context input do
        subject { Nichigazo.new(input).run }
        it { should eq expected }
      end
    end
  end
end
