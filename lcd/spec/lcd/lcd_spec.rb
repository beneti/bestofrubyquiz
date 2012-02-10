require 'spec_helper.rb'

describe LCD do
  it "should print number 1 and size 1" do
    @argv = []
    @argv << "1"
    @argv << "1"

    lcd = LCD.new(ArrayReader.new(@argv))
    lines = lcd.exec

    lines[0].should == '    '
    lines[1].should == '    '
    lines[2].should == '    '
    lines[3].should == '  | '
    lines[4].should == '    '
  end

  it "should print number 3 and default size(2)" do
    @argv = []
    @argv << "3"

    lcd = LCD.new(ArrayReader.new(@argv))
    lines = lcd.exec

    lines[0].should == ' --  '
    lines[1].should == '   | '
    lines[2].should == '   | '
    lines[3].should == ' --  '
    lines[4].should == '   | '
    lines[5].should == '   | '
    lines[6].should == ' --  '
  end

  it "should print number 29 and size 3" do
    @argv = []
    @argv << "29"
    @argv << "3"

    lcd = LCD.new(ArrayReader.new(@argv))
    lines = lcd.exec

    lines[0].should == ' ---   ---  '
    lines[1].should == '    | |   | '
    lines[2].should == '    | |   | '
    lines[3].should == '    | |   | '
    lines[4].should == ' ---   ---  '
    lines[5].should == '|         | '
    lines[6].should == '|         | '
    lines[7].should == '|         | '
    lines[8].should == ' ---   ---  '
  end

  it "should print number 012345 and default size(2)" do
    @argv = []
    @argv << "012345"

    lcd = LCD.new(ArrayReader.new(@argv))
    lines = lcd.exec

    lines[0].should == ' --        --   --        --  '
    lines[1].should == '|  |    |    |    | |  | |    '
    lines[2].should == '|  |    |    |    | |  | |    '
    lines[3].should == '           --   --   --   --  '
    lines[4].should == '|  |    | |       |    |    | '
    lines[5].should == '|  |    | |       |    |    | '
    lines[6].should == ' --        --   --        --  '
  end

  it "should print number 6789 and size 1" do
    @argv = []
    @argv << "6789"
    @argv << "1"

    lcd = LCD.new(ArrayReader.new(@argv))
    lines = lcd.exec

    lines[0].should == ' -   -   -   -  '
    lines[1].should == '|     | | | | | '
    lines[2].should == ' -       -   -  '
    lines[3].should == '| |   | | |   | '
    lines[4].should == ' -       -   -  '
  end
end
