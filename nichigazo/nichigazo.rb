class Nichigazo

  #
  # http://qiita.com/Nabetani/items/9d80de41903775296ca6#comment-8931d443b9a0d5be644c
  #
  def initialize(input)
    @input = input
    @size, @pattern = input.split(":")
    @size = @size.to_i
  end

  def run
    "#{@size}:#{exec}"
  end

  def exec
    hoge!
    ret = (dst.join + '0' * (@pattern.size * 4 - dst.join.size)).to_i(2).to_s(16)
    '0' * (@pattern.size - ret.size) + ret
  end

  def src
    pattern_to_16.join.scan(Regexp.new("." * @size))
      .map{ |e| e.split("") }[0...@size]
  end

  def hoge!
    src.each_with_index do |s, i|
      s.each_with_index do |e, j|
        dst[j][@size - i + 1] = e
      end
    end
  end

  def dst
    @dst ||= (1..@size).map { Array.new }
  end

  def pattern_to_16
    @pattern.split("").map { |e| "%04b"%e.to_i(16) }
  end
end
