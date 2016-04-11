require 'bundler/setup'
Bundler.require

require './app.rb'
require './lib/db.rb'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :imgur, ENV['IMGUR_CLIENT_ID'], ENV['IMGUR_CLIENT_SECRET']
end

run App
