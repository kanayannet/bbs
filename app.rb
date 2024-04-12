require 'sinatra/base'
require './lib/model'

class BBS < Sinatra::Base
  get '/' do
    @articles = Article.all.order(id: :desc)
    erb :index
  end

  get '/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  post '/' do
    art = params[:id].present? ?
      Article.find_by(id: params[:id]) :
      Article.new

    art.name = params[:name]
    art.subject = params[:subject]
    art.body = params[:body]
    art.save
    redirect '/'
  end

  delete '/:id' do
    art = Article.find_by(id: params[:id])
    art.delete
    content_type :json
    { status: true }.to_json
  end
end
