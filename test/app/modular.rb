require 'sinatra/base'
require File.join(File.dirname(__FILE__), 'taster')

module Bourbon
  class Tester < Sinatra::Base
    register Sinatra::BourbonTaster
  end
end
