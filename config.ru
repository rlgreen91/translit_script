require './translit_app.rb'
require './translitmiddleware'
#use TranslitMiddleware
use Rack::Reloader
run TranslitApp.new