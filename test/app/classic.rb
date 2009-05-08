require 'sinatra'

# I'm missing something here. It should be loading the routes and helpers, but all I see are 404s..
# require 'taster'

require 'sinatra/bourbon'

before do
  @name = 'Frank'
end

get '/liquid/file' do
  liquid :file
end

get '/liquid/inline' do
  liquid :inline_liquid
end

get '/liquid/block' do
  liquid do
    "This is a block template, {{name}}."
  end
end

get '/erb/file' do
  erb :file
end

get '/erb/inline' do
  erb :inline_erb
end

__END__

@@ inline_liquid
This is an inline Liquid template, {{name}}.

@@ inline_erb
This is an inline ERB template, <%= @name %>.
