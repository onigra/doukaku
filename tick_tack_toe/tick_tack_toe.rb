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

  private

  def game
    @input.scan(/[1-9]/).each_with_index do |item, idx|
      break if idx == 8
      idx = idx + 1

      break if foul_check(idx, item)
      break if win_check(idx, item)
    end

    @result = "Draw game." if @result.nil?
  end

  def foul_check(idx, item)
    if @keika.include?(item)
      if senkou?(idx)
        @result = "Foul : x won."
        true
      else
        @result = "Foul : o won."
        true
      end
    else
      @keika << item
      false
    end
  end

  def win_check(idx, item)
    if senkou?(idx)
      @senkou << item.to_i

      if WIN_PATTERN.map { |i| @senkou.sort.join =~ /#{i}/ }.any? { |w| w != nil }
        @result = "o won."
        true
      else
        false
      end
    else
      @koukou << item.to_i

      if WIN_PATTERN.map { |i| @koukou.sort.join =~ /#{i}/ }.any? { |w| w != nil }
        @result = "x won."
        true
      else
        false
      end
    end
  end

  def senkou?(index)
    (index % 2) != 0
  end
end
