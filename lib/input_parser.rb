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
	rule(:g) { match('g') }
	rule(:s) { match('s') }

	#check for k sounds
	rule(:ka) { k >> a }
	rule(:ki) { k >> i }
	rule(:ku) { k >> u }
	rule(:ke) { k >> e }
	rule(:ko) { k >> o }
	rule(:k_sounds) { ka.as(:ka) | ki.as(:ki) | ku.as(:ku) | ke.as(:ke) | ko.as(:ko) }

	#check for g sounds
	rule(:ga) { g >> a }
	rule(:gi) { g >> i }
	rule(:gu) { g >> u }
	rule(:ge) { g >> e }
	rule(:go) { g >> o }
	rule(:g_sounds) { ga.as(:ga) | gi.as(:gi) | gu.as(:gu) | ge.as(:ge) | go.as(:go) }

	#check for s sounds
	rule(:sa) { s >> a }
	rule(:si) { s >> i }
	rule(:su) { s >> u }
	rule(:se) { s >> e }
	rule(:so) { s >> o }
	rule(:s_sounds) { sa.as(:sa) | si.as(:shi) | su.as(:su) | se.as(:se) | so.as(:so) }

	#check for sounds that consist of a single vowel
	rule(:vowel) { ( a.as(:a) | i.as(:i) | u.as(:u) | e.as(:e) | o.as(:o) ).repeat(1) }

	#check for sounds that begin with a consonant
	rule(:consonant) { ( k_sounds | g_sounds | s_sounds ).repeat(1)}

	#Parse expression
	#check for vowels, then consonants
	rule(:expression) { ( vowel | consonant ).repeat(1) }
	root :expression
end

def parse(str)
	input = InputParser.new
	@answer = input.parse(str)
end