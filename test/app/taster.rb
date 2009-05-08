require 'sinatra/bourbon'

module Sinatra
  module BourbonTaster
    def self.registered(app)
      app.helpers Sinatra::Bourbon

      app.before do
        @name = 'Frank'
      end

      app.get '/liquid/file' do
        liquid :file
      end

      app.get '/liquid/inline' do
        liquid :inline_liquid
      end

      app.get '/liquid/block' do
        liquid do
          "This is a block template, {{name}}."
        end
      end

      app.get '/erb/file' do
        erb :file
      end

      app.get '/erb/inline' do
        erb :inline_erb
      end

      app.use_in_file_templates!
    end
  end
  register BourbonTaster
end

__END__

@@ inline_liquid
This is an inline Liquid template, {{name}}.

@@ inline_erb
This is an inline ERB template, <%= @name %>.
