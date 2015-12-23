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
      if full?(idx)
        @result = "Draw game."
        break
      else
        junban = Junban.now(idx)
      end

      break if foul_check(junban, item)
      break if win_check(junban, item)
    end
  end

  def foul_check(junban, item)
    if @keika.include?(item)
      case junban
      when :senkou
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

  def win_check(junban, item)
    case junban
    when :senkou
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

  def full?(index)
    index == 8
  end
end

class Junban
  def self.now(index)
    if (index.next % 2) != 0
      :senkou
    else
      :koukou
    end
  end
end
