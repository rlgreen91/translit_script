class TranslitApp
	def self.call(env)
		[200, {"Content-Type" => "text/plain"}, ["Working correctly"]]
	end
end