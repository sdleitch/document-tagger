require 'sinatra'
require 'sinatra/activerecord'
require './environments'

set :public_folder, "static"
set :views, "views"

class Document < ActiveRecord::Base
  def tag_document(params)
    self.interesting += 1 if params['interesting'] == 'on'
    self.funny += 1 if params['funny'] == 'on'
    self.boring += 1 if params['boring'] == 'on'
    self.save!
  end
end

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
  redirect to('/')
end
