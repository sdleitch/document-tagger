require 'sinatra'
require 'sinatra/activerecord'
require 'docsplit'
require './environments'
require './lib/document'
require './lib/routes'

set :session_secret, 'NOT_SO_SCRET' # Random gen secret for this and replace
set :sessions, expire_after: 172800 # 2 days (172,800 seconds)

DOC_PATH = '/documents/' # Change if your public files are somewhere
                         # other than '/public/documents/'

# The below is an Array of tags for Documents.
# Add or remove Symbols to generate the types of tags
# you would like to be able to use BEFORE migrating the database.
#
# See migration RemoveColumnsAndAddFromTags to understand how this works.
TAGS = [:intersting, :funny, :boring, :personal, :surprising]
