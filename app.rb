require 'sinatra/base'

class BBS < Sinatra::Base
  get '/' do
    'hello world'
  end
end
