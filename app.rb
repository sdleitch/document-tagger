require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require'./lib/document'

set :session_secret, 'NOT_SO_SCRET_CHANGE_THIS', # Random gen secret for this and replace
    expire_after: 172800 # 2 days (172,800 seconds)

get '/' do
  session[:tagged_docs] = [] if session[:tagged_docs].nil?
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
  session[:tagged_docs] << @document.id
  redirect to '/'
end

get '/:id/' do
  @document = Document.find(params['id'])
  erb :view
end
