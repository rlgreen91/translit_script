require './translit_app.rb'
require './translitmiddleware'
#use TranslitMiddleware
#use Reloader so that any changes are pushed without exiting server
use Rack::Reloader

#use Static to assign urls for static assets and root folder for html pages
use Rack::Static,
	:urls => ["/images", "/js", "/css"],
	:root => "public"

#calls TranslitApp, which loads index.html
run TranslitApp.new