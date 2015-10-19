require 'parslet'
include Parslet

#Parser for transliteration from english to japanese
class InputParser < Parslet::Parser
	#stop parse if there is a "q" or "v" or characters other than letters
	str('[^A-PR-UW-Za-pr-uw-z]').absent?

	#check for vowels
	rule(:a) { match('a') }
	rule(:i) { match('i') }
	rule(:u) { match('u') }
	rule(:e) { match('e') }
	rule(:o) { match('o') }

	#check for consonants
	rule(:k) { match('k') }

	#check for k sounds
	rule(:ka) { k >> a }
	rule(:ki) { k >> i }
	rule(:ku) { k >> u }
	rule(:ke) { k >> e }
	rule(:ko) { k >> o }
	rule(:k_sounds) { ka.as(:ka) | ki.as(:ki) | ku.as(:ku) | ke.as(:ke) | ko.as(:ko) }

	rule(:vowel) { ( a.as(:a) | i.as(:i) | u.as(:u) | e.as(:e) | o.as(:o) ).repeat(1) }

	#Parse expression
	#check for vowels
	rule(:expression) { ( vowel | k_sounds ).repeat(1) }
	root :expression
end

def parse(str)
	input = InputParser.new
	@answer = input.parse(str)
end