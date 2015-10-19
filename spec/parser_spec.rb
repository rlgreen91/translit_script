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

end