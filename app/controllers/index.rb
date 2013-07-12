get '/' do
  if current_user
    redirect to "/user_profile/#{current_user.id}"
  else
    @quote = Quote.all.sample
    erb :quote_scroll
  end
end

get '/author/:author_id' do 
  @author = Author.find(params[:author_id])
  erb :author
end

get '/authors' do 
  @authors = Author.all.sort_by(&:name)
  erb :authors
end

post '/quote/get' do 
  @quote = Quote.all.sample
  erb :_quote, layout: false
end

