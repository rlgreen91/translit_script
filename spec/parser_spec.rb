require_relative 'spec_helper'
require_relative '../lib/input_parser'

#test for checks for input - context describes type of parser input
RSpec.describe "test parser input type" do 
	before(:all) do
		@string_input = InputParser.new
	end

	context "only letters and no q and v" do
		it "passes successfully" do
			expect{@string_input.parse('a')}.not_to raise_error
			expect{@string_input.parse('eie')}.not_to raise_error
			expect{@string_input.parse('ieieoueiau')}.not_to raise_error
		end
	end

	context "input has q and/or v and/or characters other than letters" do
		it "raises ParseFailed" do
			expect{@string_input.parse("quiet")}.to raise_error(ParseFailed)
			expect{@string_input.parse("invalid input")}.to raise_error(ParseFailed)
			expect{@string_input.parse("I'm")}.to raise_error(ParseFailed)
		end	
	end
end

#test for parsing one vowel and vowels in combination
RSpec.describe "test vowels" do
	before(:all) do
		@string_input = InputParser.new
	end

	context "only one vowel" do
		it "parses successfully" do
			expect(@string_input.parse('a').to_s).to eq('[{:a=>"a"@0}]')
			expect(@string_input.parse('i').to_s).to eq('[{:i=>"i"@0}]')
			expect(@string_input.parse('u').to_s).to eq('[{:u=>"u"@0}]')
			expect(@string_input.parse('e').to_s).to eq('[{:e=>"e"@0}]')
			expect(@string_input.parse('o').to_s).to eq('[{:o=>"o"@0}]')
		end
	end

	context "multiple vowels" do
		it "parses successfully" do
			expect(@string_input.parse('ua').to_s).to eq('[{:u=>"u"@0}, {:a=>"a"@1}]')
			expect(@string_input.parse('oi').to_s).to eq('[{:o=>"o"@0}, {:i=>"i"@1}]')
		end
	end
end

#test for parsing single sounds starting with consonants
RSpec.describe "test single consonants" do
	before(:all) do
		@string_input = InputParser.new
	end

	context "k sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ka').to_s).to eq('[{:ka=>"ka"@0}]')
			expect(@string_input.parse('ki').to_s).to eq('[{:ki=>"ki"@0}]')
			expect(@string_input.parse('ku').to_s).to eq('[{:ku=>"ku"@0}]')
			expect(@string_input.parse('ke').to_s).to eq('[{:ke=>"ke"@0}]')
			expect(@string_input.parse('ko').to_s).to eq('[{:ko=>"ko"@0}]')
			expect(@string_input.parse('kya').to_s).to eq('[{:kya=>"kya"@0}]')
		end
	end

	context "g sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ga').to_s).to eq('[{:ga=>"ga"@0}]')
			expect(@string_input.parse('gi').to_s).to eq('[{:gi=>"gi"@0}]')
			expect(@string_input.parse('gu').to_s).to eq('[{:gu=>"gu"@0}]')
			expect(@string_input.parse('ge').to_s).to eq('[{:ge=>"ge"@0}]')
			expect(@string_input.parse('go').to_s).to eq('[{:go=>"go"@0}]')
			expect(@string_input.parse('gya').to_s).to eq('[{:gya=>"gya"@0}]')
		end
	end

	context "s sounds" do
		it "parses successfully" do
			expect(@string_input.parse('sa').to_s).to eq('[{:sa=>"sa"@0}]')
			expect(@string_input.parse('si').to_s).to eq('[{:shi=>"si"@0}]')
			expect(@string_input.parse('su').to_s).to eq('[{:su=>"su"@0}]')
			expect(@string_input.parse('se').to_s).to eq('[{:se=>"se"@0}]')
			expect(@string_input.parse('so').to_s).to eq('[{:so=>"so"@0}]')
			expect(@string_input.parse('sha').to_s).to eq('[{:sha=>"sha"@0}]')
			expect(@string_input.parse('shi').to_s).to eq('[{:shi=>"shi"@0}]')
		end
	end

	context "z sounds" do
		it "parses successfully" do
			expect(@string_input.parse('za').to_s).to eq('[{:za=>"za"@0}]')
			expect(@string_input.parse('zi').to_s).to eq('[{:ji=>"zi"@0}]')
			expect(@string_input.parse('zu').to_s).to eq('[{:zu=>"zu"@0}]')
			expect(@string_input.parse('ze').to_s).to eq('[{:ze=>"ze"@0}]')
			expect(@string_input.parse('zo').to_s).to eq('[{:zo=>"zo"@0}]')
		end
	end

	context "t sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ta').to_s).to eq('[{:ta=>"ta"@0}]')
			expect(@string_input.parse('ti').to_s).to eq('[{:chi=>"ti"@0}]')
			expect(@string_input.parse('tu').to_s).to eq('[{:tsu=>"tu"@0}]')
			expect(@string_input.parse('te').to_s).to eq('[{:te=>"te"@0}]')
			expect(@string_input.parse('to').to_s).to eq('[{:to=>"to"@0}]')
			expect(@string_input.parse('tsu').to_s).to eq('[{:tsu=>"tsu"@0}]')
		end
	end

	context "d sounds" do
		it "parses successfully" do
			expect(@string_input.parse('da').to_s).to eq('[{:da=>"da"@0}]')
			expect(@string_input.parse('di').to_s).to eq('[{:di=>"di"@0}]')
			expect(@string_input.parse('du').to_s).to eq('[{:dzu=>"du"@0}]')
			expect(@string_input.parse('de').to_s).to eq('[{:de=>"de"@0}]')
			expect(@string_input.parse('do').to_s).to eq('[{:ado=>"do"@0}]')
			expect(@string_input.parse('dzu').to_s).to eq('[{:dzu=>"dzu"@0}]')
		end
	end

	context "n sounds" do
		it "parses successfully" do
			expect(@string_input.parse('na').to_s).to eq('[{:na=>"na"@0}]')
			expect(@string_input.parse('ni').to_s).to eq('[{:ni=>"ni"@0}]')
			expect(@string_input.parse('nu').to_s).to eq('[{:nu=>"nu"@0}]')
			expect(@string_input.parse('ne').to_s).to eq('[{:ne=>"ne"@0}]')
			expect(@string_input.parse('no').to_s).to eq('[{:no=>"no"@0}]')
		end
	end

	context "h sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ha').to_s).to eq('[{:ha=>"ha"@0}]')
			expect(@string_input.parse('hi').to_s).to eq('[{:hi=>"hi"@0}]')
			expect(@string_input.parse('hu').to_s).to eq('[{:fu=>"hu"@0}]')
			expect(@string_input.parse('he').to_s).to eq('[{:he=>"he"@0}]')
			expect(@string_input.parse('ho').to_s).to eq('[{:ho=>"ho"@0}]')
		end
	end

	context "b sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ba').to_s).to eq('[{:ba=>"ba"@0}]')
			expect(@string_input.parse('bi').to_s).to eq('[{:bi=>"bi"@0}]')
			expect(@string_input.parse('bu').to_s).to eq('[{:bu=>"bu"@0}]')
			expect(@string_input.parse('be').to_s).to eq('[{:be=>"be"@0}]')
			expect(@string_input.parse('bo').to_s).to eq('[{:bo=>"bo"@0}]')
		end
	end

	context "m sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ma').to_s).to eq('[{:ma=>"ma"@0}]')
			expect(@string_input.parse('mi').to_s).to eq('[{:mi=>"mi"@0}]')
			expect(@string_input.parse('mu').to_s).to eq('[{:mu=>"mu"@0}]')
			expect(@string_input.parse('me').to_s).to eq('[{:me=>"me"@0}]')
			expect(@string_input.parse('mo').to_s).to eq('[{:mo=>"mo"@0}]')
		end
	end

	context "y sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ya').to_s).to eq('[{:ya=>"ya"@0}]')
			expect(@string_input.parse('yu').to_s).to eq('[{:yu=>"yu"@0}]')
			expect(@string_input.parse('yo').to_s).to eq('[{:yo=>"yo"@0}]')
		end
	end

	context "r sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ra').to_s).to eq('[{:ra=>"ra"@0}]')
			expect(@string_input.parse('ri').to_s).to eq('[{:ri=>"ri"@0}]')
			expect(@string_input.parse('ru').to_s).to eq('[{:ru=>"ru"@0}]')
			expect(@string_input.parse('re').to_s).to eq('[{:re=>"re"@0}]')
			expect(@string_input.parse('ro').to_s).to eq('[{:ro=>"ro"@0}]')
		end
	end

	context "w sounds" do
		it "parses successfully" do
			expect(@string_input.parse('wa').to_s).to eq('[{:wa=>"wa"@0}]')
			expect(@string_input.parse('wo').to_s).to eq('[{:wo=>"wo"@0}]')
		end
	end

	context "j sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ja').to_s).to eq('[{:ja=>"ja"@0}]')
			expect(@string_input.parse('ji').to_s).to eq('[{:ji=>"ji"@0}]')
			expect(@string_input.parse('ju').to_s).to eq('[{:ju=>"ju"@0}]')
			expect(@string_input.parse('jo').to_s).to eq('[{:jo=>"jo"@0}]')
		end
	end

	context "double n" do
		it "parses successfully" do
			expect(@string_input.parse('nn').to_s).to eq('[{:nn=>"nn"@0}]')
		end
	end

	context "c sounds" do
		it "parses successfully" do
			expect(@string_input.parse('chi').to_s).to eq('[{:chi=>"chi"@0}]')
		end
	end

	context "f sounds" do
		it "parses successfully" do
			expect(@string_input.parse('fu').to_s).to eq('[{:fu=>"fu"@0}]')
		end
	end

	context "small y sounds" do
		it "parses successfully" do
			expect(@string_input.parse('xya').to_s).to eq('[{:xya=>"xya"@0}]')
		end
	end
end

#test for parsing words
RSpec.describe "test for complete words" do
	before(:all) do
		@string_input = InputParser.new
	end

	context "complete words of two letter sounds and vowels no double n" do
		it "parses successfully" do
			expect(@string_input.parse('kuruma').to_s).to eq('[{:ku=>"ku"@0}, {:ru=>"ru"@2}, {:ma=>"ma"@4}]')
			expect(@string_input.parse('anata').to_s).to eq('[{:a=>"a"@0}, {:na=>"na"@1}, {:ta=>"ta"@3}]')
			expect(@string_input.parse('oozei').to_s).to eq('[{:o=>"o"@0}, {:o=>"o"@1}, {:ze=>"ze"@2}, {:i=>"i"@4}]')
			expect(@string_input.parse('jou').to_s).to eq('[{:jo=>"jo"@0}, {:u=>"u"@2}]')
		end
	end

	context "complete words of two letter sounds and vowels including double n" do
		it "parses successfully" do
			expect(@string_input.parse('honnya').to_s).to eq('[{:ho=>"ho"@0}, {:nn=>"nn"@2}, {:ya=>"ya"@4}]')
			expect(@string_input.parse('hanngaku').to_s).to eq('[{:ha=>"ha"@0}, {:nn=>"nn"@2}, {:ga=>"ga"@4}, {:ku=>"ku"@6}]')
			expect(@string_input.parse('rinngo').to_s).to eq('[{:ri=>"ri"@0}, {:nn=>"nn"@2}, {:go=>"go"@4}]')
			expect(@string_input.parse('banngou').to_s).to eq('[{:ba=>"ba"@0}, {:nn=>"nn"@2}, {:go=>"go"@4}, {:u=>"u"@6}]') 
		end
	end
end