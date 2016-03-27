require 'sinatra'
require 'sinatra/activerecord'
require 'docsplit'
require './environments'
require './lib/document'
require './lib/routes'

set :session_secret, 'NOT_SO_SCRET' # Random gen secret for this and replace
set :sessions, expire_after: 172800 # 2 days (172,800 seconds)
