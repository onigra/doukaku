class TickTackToe
  WIN_PATTERN = [
    "123",
    "456",
    "789",
    "147",
    "258",
    "369",
    "159",
    "357",
  ]

  def initialize(input)
    @input = input.to_s
    @senkou = []
    @koukou = []
    @keika = []
    @result = nil
  end

  def run
    game
    @result
  end

  def game
    @input.scan(/[1-9]/).each_with_index do |item, idx|
      break if idx == 8
      idx = idx + 1

      if @keika.include?(item)
        if (idx % 2) == 0
          @result = "Foul : o won."
          break
        else
          @result = "Foul : x won."
          break
        end
      else
        @keika << item
      end

      if (idx % 2) == 0
        @koukou << item.to_i

        if WIN_PATTERN.map { |i| @koukou.sort.join =~ /#{i}/ }.any? { |w| w != nil }
          @result = "x won."
          break
        end
      else
        @senkou << item.to_i

        if WIN_PATTERN.map { |i| @senkou.sort.join =~ /#{i}/ }.any? { |w| w != nil }
          @result = "o won."
          break
        end
      end
    end

    @result = "Draw game." if @result.nil?
  end
end
