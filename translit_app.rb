class TranslitApp
	def call(env)
		[200, {"Content-Type" => "text/plain"}, ["Working correctly"]]
	end
end