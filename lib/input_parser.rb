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
	rule(:h) { match('h') }
	rule(:b) { match('b') }
	rule(:m) { match('m') }
	rule(:y) { match('y') }
	rule(:r) { match('r') }
	rule(:w) { match('w') }
	rule(:j) { match('j') }
	rule(:c) { match('c') }
	rule(:f) { match('f') }
	rule(:x) { match('x') }

	#check for k sounds
	rule(:ka) { k >> a }
	rule(:ki) { k >> i }
	rule(:ku) { k >> u }
	rule(:ke) { k >> e }
	rule(:ko) { k >> o }
	rule(:kya) { k >> y >> a }
	rule(:k_sounds) { ka.as(:ka) | ki.as(:ki) | ku.as(:ku) | ke.as(:ke) | ko.as(:ko) | kya.as(:kya) }

	#check for g sounds
	rule(:ga) { g >> a }
	rule(:gi) { g >> i }
	rule(:gu) { g >> u }
	rule(:ge) { g >> e }
	rule(:go) { g >> o }
	rule(:gya) { g >> y >> a }
	rule(:g_sounds) { ga.as(:ga) | gi.as(:gi) | gu.as(:gu) | ge.as(:ge) | go.as(:go) | gya.as(:gya) }

	#check for s sounds
	rule(:sa) { s >> a }
	rule(:si) { s >> i }
	rule(:su) { s >> u }
	rule(:se) { s >> e }
	rule(:so) { s >> o }
	rule(:sha) { s >> h >> a }
	rule(:shi) { s >> h >> i }
	rule(:s_sounds) { sa.as(:sa) | si.as(:shi) | su.as(:su) | se.as(:se) | so.as(:so) | sha.as(:sha) | shi.as(:shi) }

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
	rule(:tsu) { t >> s >> u }
	rule(:t_sounds) { ta.as(:ta) | ti.as(:chi) | tu.as(:tsu) | te.as(:te) | to.as(:to) | tsu.as(:tsu) }

	#check for d sounds
	#ado represents do, which can't be used as it's a keyword in ruby
	rule(:da) { d >> a }
	rule(:di) { d >> i }
	rule(:du) { d >> u }
	rule(:de) { d >> e }
	rule(:ado) { d >> o }
	rule(:dzu) { d >> z >> u }
	rule(:d_sounds) { da.as(:da) | di.as(:di) | du.as(:dzu) | de.as(:de) | ado.as(:ado) | dzu.as(:dzu) }

	#check for n sounds
	rule(:na) { n >> a }
	rule(:ni) { n >> i }
	rule(:nu) { n >> u }
	rule(:ne) { n >> e }
	rule(:no) { n >> o }
	rule(:n_sounds) { na.as(:na) | ni.as(:ni) | nu.as(:nu) | ne.as(:ne) | no.as(:no) }

	#check for h sounds
	rule(:ha) { h >> a }
	rule(:hi) { h >> i }
	rule(:hu) { h >> u }
	rule(:he) { h >> e }
	rule(:ho) { h >> o }
	rule(:h_sounds) { ha.as(:ha) | hi.as(:hi) | hu.as(:fu) | he.as(:he) | ho.as(:ho) }

	#check for b sounds
	rule(:ba) { b >> a }
	rule(:bi) { b >> i }
	rule(:bu) { b >> u }
	rule(:be) { b >> e }
	rule(:bo) { b >> o }
	rule(:b_sounds) { ba.as(:ba) | bi.as(:bi) | bu.as(:bu) | be.as(:be) | bo.as(:bo) }

	#check for m sounds
	rule(:ma) { m >> a }
	rule(:mi) { m >> i }
	rule(:mu) { m >> u }
	rule(:me) { m >> e }
	rule(:mo) { m >> o }
	rule(:m_sounds) { ma.as(:ma) | mi.as(:mi) | mu.as(:mu) | me.as(:me) | mo.as(:mo) }

	#check for y sounds
	rule(:ya) { y >> a }
	rule(:yu) { y >> u }
	rule(:yo) { y >> o }
	rule(:y_sounds) { ya.as(:ya) | yu.as(:yu) | yo.as(:yo) }

	#chck for r sounds
	rule(:ra) { r >> a }
	rule(:ri) { r >> i }
	rule(:ru) { r >> u }
	rule(:re) { r >> e }
	rule(:ro) { r >> o }
	rule(:r_sounds) { ra.as(:ra) | ri.as(:ri) | ru.as(:ru) | re.as(:re) | ro.as(:ro) }

	#check for w sounds
	rule(:wa) { w >> a }
	rule(:wo) { w >> o }
	rule(:w_sounds) { wa.as(:wa) | wo.as(:wo) }

	#check for j sounds
	rule(:ja) { j >> a }
	rule(:ji) { j >> i }
	rule(:ju) { j >> u }
	rule(:jo) { j >> o }
	rule(:j_sounds) { ja.as(:ja) | ji.as(:ji) | ju.as(:ju) | jo.as(:jo) }

	#check for double n
	rule(:nn) { n >> n }
	rule(:double_n) { nn.as(:nn) }

	#check for c sounds
	rule(:chi) { c >> h >> i }
	rule(:c_sounds) { chi.as(:chi) }

	#check for f sounds
	rule(:fu) { f >> u }
	rule(:f_sounds) { fu.as(:fu) }

	#check for small y sounds
	rule(:xya) { x >> y >> a }
	rule(:small_y_sounds) { xya.as(:xya) }

	#check for sounds that consist of a single vowel
	rule(:vowel) { ( a.as(:a) | i.as(:i) | u.as(:u) | e.as(:e) | o.as(:o) ).repeat(1) }

	#check for sounds that begin with a consonant
	rule(:consonant) { ( k_sounds | g_sounds | s_sounds | z_sounds | t_sounds | d_sounds | n_sounds | h_sounds | 
		                 b_sounds | m_sounds | y_sounds | r_sounds | w_sounds | j_sounds | double_n | c_sounds |
		                 f_sounds | small_y_sounds ).repeat(1)}

	#Parse expression
	#check for vowels, then consonants
	rule(:expression) { ( vowel | consonant ).repeat(1) }
	root :expression
end

def parse(str)
	input = InputParser.new
	@answer = input.parse(str)
end