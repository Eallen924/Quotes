post '/create_user' do
  p params
  @user = User.new(params[:user])
  p @user
  if @user.save
    session[:user_id] = @user.id
    redirect to '/'
  else
    @errors = @user.errors.full_messages
    erb :create_user
  end
end

get '/create_user' do

  @user ||= User.new
  erb :create_user
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to "/user_profile/#{@user.id}"
  else
    @errors = ["Invalid login details"]
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

