require_relative 'spec_helper'

#Describe the index page
#It returns a successful response

RSpec.describe "GET index", :type => :feature do 
	it "returns http success" do
		visit '/index'
		expect(response).to be_success
	end	
end
