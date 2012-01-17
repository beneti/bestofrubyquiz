require 'spec_helper.rb'

describe MadLibs do
  it "should replace 3 different words" do
    @to_replacement = []
    @to_replacement << "I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((a body part)) and ((a noun))."
    @to_replacement << "smelly"
    @to_replacement << "big toe"
    @to_replacement << "bathtub"

    ml = MadLibs.new(ArrayReader.new(@to_replacement))

    ml.exec.should == "I had a smelly sandwich for lunch today. It dripped all over my big toe and bathtub."
  end

  it "should replace 3 times a same word" do
    @to_replacement = []
    @to_replacement << "I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((an adjective)) and ((an adjective))."
    @to_replacement << "smelly"
    @to_replacement << "smelly2"
    @to_replacement << "smelly3"
    ml = MadLibs.new(ArrayReader.new(@to_replacement))

    ml.exec.should == "I had a smelly sandwich for lunch today. It dripped all over my smelly2 and smelly3."
  end

  it "should replace 3 times with label" do
    @to_replacement = []
    @to_replacement << "Our favorite language is ((gem:a gemstone)). We think ((gem)) is better than ((a gemstone))."
    @to_replacement << "Ruby"
    @to_replacement << "Emerald"
    ml = MadLibs.new(ArrayReader.new(@to_replacement))

    ml.exec.should == "Our favorite language is Ruby. We think Ruby is better than Emerald."
  end
end
