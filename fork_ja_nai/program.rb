require "pp"

class Program
  def initialize
    @regis = [
      { "1" => [] },
      { "2" => [] },
      { "3" => [] },
      { "4" => [] },
      { "5" => [] }
    ]
  end

  def run(input)
    foo = input.split("")

    foo.each do |item|
      if item == "."
        @regis.each do |i|
          regi1 i["1"] if i.keys.first == "1"
          regi2 i["2"] if i.keys.first == "2"
          regi3 i["3"] if i.keys.first == "3"
          regi4 i["4"] if i.keys.first == "4"
          regi5 i["5"] if i.keys.first == "5"
        end
      elsif item == "x"
        @regis.sort_by! { |i| [i.values.first.size, i.keys.first.to_i] }
        @regis.first.values.first << item
      else
        @regis.sort_by! { |i| [i.values.first.size, i.keys.first.to_i] }
        @regis.first.values.first << ("1" * item.to_i).split("")
        @regis.first.values.first.flatten!
      end
    end

    @regis.sort_by! { |i| i.keys.first.to_i }
    @regis.map { |i| i.values }.flatten(1).map(&:size).join(",")
  end

  def regi1(regi)
    2.times do |i|
      if regi.first == "x"
        break
      else
        regi.shift 
      end
    end
  end

  def regi2(regi)
    7.times do |i|
      if regi.first == "x"
        break
      else
        regi.shift 
      end
    end
  end

  def regi3(regi)
    3.times do |i|
      if regi.first == "x"
        break
      else
        regi.shift 
      end
    end
  end

  def regi4(regi)
    5.times do |i|
      if regi.first == "x"
        break
      else
        regi.shift 
      end
    end
  end

  def regi5(regi)
    2.times do |i|
      if regi.first == "x"
        break
      else
        regi.shift 
      end
    end
  end
end
