class MadLibs

	def initialize(reader = InputReader.new)
    @reader = reader
  end

	def exec
    sentence = @reader.read("Give me a sentence")
		#get (( word )) or ((label: word))
		words = sentence.scan(/\(\((.*?)\)\)/).flatten

		#:label => value. ex: :gem => ruby
		labels = []

		words.each do |word|
			scanned = false
			#check if is a label -> label: word
			scan = word.scan(/(.*):(.*)/).flatten

			if !scan.empty?
				word = scan[1]
				scanned = true
			end

			if labels.empty? || (labels.find{|label| label[word.to_sym]}) == nil
        to_replace = @reader.read(word)
			else
				to_replace = labels.find{|label| label[word.to_sym]}.values.first
			end

			labels << {scan[0].to_sym => to_replace} if scanned
			sentence = sentence.sub(/\(\((#{scan[0]}:)?#{word}\)\)/,to_replace)
		end

		sentence
	end
end

#aux classes
class InputReader
  def initialize(input = STDIN)
    @input = input
  end

  def read(message = "")
    puts message
    @input.gets.chomp
  end
end


class ArrayReader
  def initialize(input = [])
    @input = input
  end

  def read(message = "")
    @input.shift
  end
end

