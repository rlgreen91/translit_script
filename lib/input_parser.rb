require 'parslet'
include Parslet

#Parser for transliteration from english to japanese
class InputParser < Parslet::Parser
	#check for vowels
	rule(:vowel) { match('a') | match('e') | match('i') | match('o') | match('u')}

	#Parse expression
	#check for vowels
	rule(:expression) { vowel.repeat(1) }
	root :expression
end

def parse(str)
	input = InputParser.new
	@answer = input.parse(str)
end