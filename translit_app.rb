#calling TranslitApp deploys index.html as the home page 
class TranslitApp
	def call(env)
		[200, {'Content-Type' => 'text/html'}, File.open('public/index.html', File::RDONLY)]
	end
end