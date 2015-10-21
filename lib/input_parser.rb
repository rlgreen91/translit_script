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
	rule(:z) { match('z') }
	rule(:t) { match('t') }
	rule(:d) { match('d') }
	rule(:n) { match('n') }

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

	#check for z sounds
	rule(:za) { z >> a }
	rule(:zi) { z >> i }
	rule(:zu) { z >> u }
	rule(:ze) { z >> e }
	rule(:zo) { z >> o }
	rule(:z_sounds) { za.as(:za) | zi.as(:ji) | zu.as(:zu) | ze.as(:ze) | zo.as(:zo) }

	#check for t sounds
	rule(:ta) { t >> a }
	rule(:ti) { t >> i }
	rule(:tu) { t >> u }
	rule(:te) { t >> e }
	rule(:to) { t >> o }
	rule(:t_sounds) { ta.as(:ta) | ti.as(:chi) | tu.as(:tsu) | te.as(:te) | to.as(:to) }

	#check for d sounds
	#ado represents do, which can't be used as it's a keyword in ruby
	rule(:da) { d >> a }
	rule(:di) { d >> i }
	rule(:du) { d >> u }
	rule(:de) { d >> e }
	rule(:ado) { d >> o }
	rule(:d_sounds) { da.as(:da) | di.as(:di) | du.as(:dzu) | de.as(:de) | ado.as(:ado) }

	#check for n sounds
	rule(:na) { n >> a }
	rule(:ni) { n >> i }
	rule(:nu) { n >> u }
	rule(:ne) { n >> e }
	rule(:no) { n >> o }
	rule(:n_sounds) { na.as(:na) | ni.as(:ni) | nu.as(:nu) | ne.as(:ne) | no.as(:no) }

	#check for sounds that consist of a single vowel
	rule(:vowel) { ( a.as(:a) | i.as(:i) | u.as(:u) | e.as(:e) | o.as(:o) ).repeat(1) }

	#check for sounds that begin with a consonant
	rule(:consonant) { ( k_sounds | g_sounds | s_sounds | z_sounds | t_sounds | d_sounds | n_sounds ).repeat(1)}

	#Parse expression
	#check for vowels, then consonants
	rule(:expression) { ( vowel | consonant ).repeat(1) }
	root :expression
end

def parse(str)
	input = InputParser.new
	@answer = input.parse(str)
end