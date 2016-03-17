require 'sinatra'
require 'sinatra/activerecord'
require './environments'

set :public_folder, "static"
set :views, "views"

class Document < ActiveRecord::Base
end

get '/' do
  @documents = Document.all
  erb :index
end
