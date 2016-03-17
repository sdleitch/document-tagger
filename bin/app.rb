require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require'./lib/models/document.rb'

set :public_folder, "static"
set :views, "views"

get '/' do
  @documents = Document.all
  erb :index
end

get '/tag/' do
  @document = Document.all.sample
  erb :tag
end

post '/tag/' do
  @document = Document.find(params['id'])
  @document.tag_document(params)
  redirect to '/'
end

get '/:id/' do
  @document = Document.find(params['id'])
  erb :view_document
end
