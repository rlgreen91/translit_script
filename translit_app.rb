class TranslitApp
	def call env
		[200, {"Content-Type" => "text/html"}, ["Working correctly"]]
	end
end