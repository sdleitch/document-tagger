require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require'./lib/document'

set :session_secret, 'NOT_SO_SCRET' # Random gen secret for this and replace
set :sessions, expire_after: 172800 # 2 days (172,800 seconds)

get '/' do
  session[:tagged_docs] = [] if session[:tagged_docs].nil?
  @documents = Document.all
  erb :index
end

get '/tag/' do
  @document = Document.pick_document(session[:tagged_docs])
  erb :tag
end

post '/tag/' do
  @document = Document.find(params['id'])
  @document.tag_document(params)
  session[:tagged_docs] << @document.id
  redirect '/tag/'
end

get '/:id/' do
  if session[:tagged_docs].length > 4
    @document = Document.find(params['id'])
  else
    session[:flash_message] = "Please help us out by tagging a few more documents before viewing them! It's your help which makes the project possible."
    redirect '/tag/'
  end
  erb :view
end

get '/view/:tag/' do |tag|
  if session[:tagged_docs].length > 4
    # Get top documents...
    @documents = Document.all.sort { |a, b| b[tag] <=> a[tag] }
  else
    session[:flash_message] = "Please help us out by tagging a few more documents before viewing them! It's your help which makes the project possible."
    redirect '/tag/'
  end
  erb :display_top
end
