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
        return @result = "Draw game."
      else
        junban = Junban.now(idx)
      end

      break if foul_check(junban, item)
      break if win_check(junban, item)
    end
  end

  def foul_check(junban, item)
    if foul?(item)
      case junban
      when :senkou
        @result = "Foul : x won."
      else
        @result = "Foul : o won."
      end
    else
      @keika << item
      false
    end
  end

  def win_check(junban, item)
    case junban
    when :senkou
      if win?(@senkou << item.to_i)
        @result = "o won."
      else
        false
      end
    else
      if win?(@koukou << item.to_i)
        @result = "x won."
      else
        false
      end
    end
  end

  def full?(index)
    index == 8
  end

  def win?(list)
    WIN_PATTERN.map { |i| list.sort.join =~ /#{i}/ }.any? { |w| w != nil }
  end

  def foul?(item)
    @keika.include?(item)
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
