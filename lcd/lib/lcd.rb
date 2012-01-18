class LCD
  def initialize(reader = ArgvReader.new)
    @reader = reader
  end

  #there are 5 patterns to simulate a line in LCD (size 1)
  # ' - ' middle
  # '| |' double
  # '|  ' left
  # '  |' right
  # '   ' none
  # joining this patterns, possible to simulate any Digit [0-9]
  def create_display
    space = ' '*@reader.size
    middle = " #{'-'*@reader.size}  "
    double = "|#{space}| "
    right  = " #{space}| "
    left   = "|#{space}  "
    none   = " #{space}  "
    @display = {'0' => [middle, double, none,   double, middle],
                '1' => [none,   right,  none,   right,  none],
                '2' => [middle, right,  middle, left,   middle],
                '3' => [middle, right,  middle, right,  middle],
                '4' => [none,   double, middle, right,  none],
                '5' => [middle, left,   middle, right,  middle],
                '6' => [middle, left,   middle, double, middle],
                '7' => [middle, right,  none,   right,  none],
                '8' => [middle, double, middle, double, middle],
                '9' => [middle, double, middle, right,  middle]}
  end

  def create_lines
    lines = []
    #necessary to add 'vertical lines' * [-s]. 'vertical lines' = odd index
    5.times {|i| (i%2==0 ? 1 : @reader.size).times{|a| lines << @reader.number.inject('') {|s,d| s+= @display[d][i] }}}
    lines
  end

  def exec
    @reader.read
    create_display
    create_lines
  end
end

class ArgvReader
  attr_accessor :size, :number

  def initialize(input = ARGV)
    @input = input
  end

  def read(s = 2)
    if @input[0]==nil
      puts "to exec: lcd.rb [-s size] digits"
      exit
    end
    @size = @input[0] == '-s' ? @input[1].to_i : s
    @number = @input[0] == '-s' ? @input[2].split(//) : @input[0].split(//)
  end
end

class ArrayReader
  attr_accessor :size, :number

  def initialize(input = [])
    @input = input
  end

  def read(s = 2)
    @number = @input.shift.split(//)
    @size = (@input.shift || s).to_i
  end
end

if ARGV[0] !~ /-*spec.rb/
  lcd = LCD.new
  puts lcd.exec
end

