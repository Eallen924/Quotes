get '/' do
  if current_user
    redirect to "/user_profile/#{current_user.id}"
  else
    @quote = Quote.all.sample
    erb :index
  end
end

get '/author/:author_id' do
  @author = Author.find(params[:author_id])
  erb :author
end

get '/authors' do
  @authors = Author.all.sort_by(&:name)
  erb :list_authors
end

get '/quote' do

  puts "quote -- ive been called"
  puts "*" * 80
  @quote = Quote.all.sample
  puts "*" * 80
  p @quote.body
  puts "*" * 80
  erb :_quote, layout: !request.xhr?
end

get '/test' do
  p "hit the route"
  "this is a result" if request.xhr?
end


# if request.xhr?
#   content_type :json
#   {body: @quote.body, author: @quote.author.name}.to_json
# else
#   erb :_quote
# end