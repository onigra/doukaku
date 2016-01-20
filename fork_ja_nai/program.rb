require "pp"

class RegisterBase
  attr_accessor :assign, :current

  def initialize
    @assign = nil
    @current = 0
  end

  def exec
    if @assign == "x"
      @current += 1
      @assign = nil
    else
      @current = @assign.to_i - @shori
      @current < 0 ? @current = 0 : @current
      @assign = nil
    end
  end

  def do
    unless @assign.nil?
      if @assign == "x"
        @current = 1
      else
        @current = @assign
      end
    end
  end
end

class Register1 < RegisterBase
  def initialize
    super
    @number = 1
    @shori = 2
  end
end

class Register2 < RegisterBase
  def initialize
    super
    @number = 2
    @shori = 7
  end
end

class Register3 < RegisterBase
  def initialize
    super
    @number = 3
    @shori = 3
  end
end

class Register4 < RegisterBase
  def initialize
    super
    @number = 4
    @shori = 5
  end
end

class Register5 < RegisterBase
  def initialize
    super
    @number = 5
    @shori = 7
  end
end

class Program
  def initialize
    @result = nil
    @registers = [
      Register1.new,
      Register2.new,
      Register3.new,
      Register4.new,
      Register5.new,
    ]
  end

  def run(input)
    foo = input.split("")

    foo.each do |i|
      if i == "."
        @registers.each { |regi| regi.exec }
      else
        @registers.sort { |regi| regi.current }.each do |item|
          if item.assign.nil?
            item.assign = i
            break
          end
        end
      end

      pp @registers
    end

    @registers.each { |i| i.do }.map(&:current).join(",")
  end
end
