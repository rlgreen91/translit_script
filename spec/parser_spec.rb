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
		end
	end

	context "g sounds" do
		it "parses successfully" do
			expect(@string_input.parse('ga').to_s).to eq('[{:ga=>"ga"@0}]')
			expect(@string_input.parse('gi').to_s).to eq('[{:gi=>"gi"@0}]')
			expect(@string_input.parse('gu').to_s).to eq('[{:gu=>"gu"@0}]')
			expect(@string_input.parse('ge').to_s).to eq('[{:ge=>"ge"@0}]')
			expect(@string_input.parse('go').to_s).to eq('[{:go=>"go"@0}]')
		end
	end

	context "s sounds" do
		it "parses successfully" do
			expect(@string_input.parse('sa').to_s).to eq('[{:sa=>"sa"@0}]')
			expect(@string_input.parse('si').to_s).to eq('[{:shi=>"si"@0}]')
			expect(@string_input.parse('su').to_s).to eq('[{:su=>"su"@0}]')
			expect(@string_input.parse('se').to_s).to eq('[{:se=>"se"@0}]')
			expect(@string_input.parse('so').to_s).to eq('[{:so=>"so"@0}]')
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
		end
	end

	context "d sounds" do
		it "parses successfully" do
			expect(@string_input.parse('da').to_s).to eq('[{:da=>"da"@0}]')
			expect(@string_input.parse('di').to_s).to eq('[{:di=>"di"@0}]')
			expect(@string_input.parse('du').to_s).to eq('[{:dzu=>"du"@0}]')
			expect(@string_input.parse('de').to_s).to eq('[{:de=>"de"@0}]')
			expect(@string_input.parse('do').to_s).to eq('[{:ado=>"do"@0}]')
		end
	end
end