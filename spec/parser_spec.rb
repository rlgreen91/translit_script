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
		it "parses succesfully" do
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
end