get '/' do
  session[:tagged_docs] = [] if session[:tagged_docs].nil?
  @documents = Document.all
  erb :index
end

get '/tag/' do
  @document = Document.pick_document(session[:tagged_docs])
  @document.body = @document.to_text if @document.body.nil?
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
    @document.body = @document.to_text if @document.body.nil?
  else
    session[:flash_message] = "Please help us out by tagging a few more documents before viewing them! It's your help which makes the project possible."
    redirect '/tag/'
  end
  erb :view
end

get '/view/:tag/' do |tag|
  if session[:tagged_docs].length > 4
    # Get top documents and sort, most to fewest, by tag parameter.
    @documents = Document.all.sort { |a, b| b[tag] <=> a[tag] }
  else
    session[:flash_message] = "Please help us out by tagging a few more documents before viewing them! It's your help which makes the project possible."
    redirect '/tag/'
  end
  erb :display_top
end
