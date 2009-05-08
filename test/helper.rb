require 'test/unit'
require 'webrat/sinatra'
require File.join(File.dirname(__FILE__), 'app', ENV['RACK_ENV'])

Webrat.configure do |config|
  config.mode = :sinatra
end
