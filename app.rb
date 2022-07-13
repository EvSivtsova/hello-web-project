require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return "Hello World"
  end

  get '/hello' do
    @name = params[:name]
    return erb(:hello_name)
  end

  post '/submit' do
    name = params[:name]
    return "Thanks #{name}, you sent this message: 'Hello world'"
  end

  get '/names' do
    names = params[:names]
    return "#{names}"
  end

  post '/sort-names' do
    names = params[:names]
    names_sorted = names.split(",").sort.join(",")
    return names_sorted
  end
end