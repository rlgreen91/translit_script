require './translit_app.rb'
require './translitmiddleware'
#use TranslitMiddleware
use Rack::Reloader
use Rack::Static,
	:urls => ["/images", "/js", "/css"],
	:root => "public"

run lambda { |env| 
	[200, {'Content-Type' => 'text/html'}, File.open('public/index.html', File::RDONLY)]
}