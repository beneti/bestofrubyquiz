require "./madlibs"
require "test/unit"

class TestMadLibs < Test::Unit::TestCase

	def test_no_label

		@to_replacement = []
		@to_replacement << "I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((a body part)) and ((a noun))."
		@to_replacement << "smelly"
		@to_replacement << "big toe"
		@to_replacement << "bathtub"

		ml = MadLibs.new(ArrayReader.new(@to_replacement))

		assert_equal("I had a smelly sandwich for lunch today. It dripped all over my big toe and bathtub.",ml.exec)
	end

	def test_no_label_same_words

		@to_replacement = []
		@to_replacement << "I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((an adjective)) and ((an adjective))."
		@to_replacement << "smelly"
		@to_replacement << "smelly2"
		@to_replacement << "smelly3"
		ml = MadLibs.new(ArrayReader.new(@to_replacement))

		assert_equal("I had a smelly sandwich for lunch today. It dripped all over my smelly2 and smelly3.",ml.exec)
	end


	def test_label

		@to_replacement = []
		@to_replacement << "Our favorite language is ((gem:a gemstone)). We think ((gem)) is better than ((a gemstone))."
		@to_replacement << "Ruby"
		@to_replacement << "Emerald"
		ml = MadLibs.new(ArrayReader.new(@to_replacement))

		assert_equal("Our favorite language is Ruby. We think Ruby is better than Emerald.",ml.exec)
	end

end

