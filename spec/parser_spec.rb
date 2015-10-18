require_relative 'spec_helper'
require_relative '../lib/input_parser'

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

RSpec.describe "test vowels" do
	before(:all) do
		@string_input = InputParser.new
	end

	context "only one vowel" do
		it "parses succesfully" do
			expected = '[{:a=>"a"@0}]'
			expect(@string_input.parse('a').to_s).to eq(expected)
		end
	end

end