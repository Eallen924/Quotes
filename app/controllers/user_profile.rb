get '/user_profile/:user_id' do
  @user = User.find(params[:user_id])
  if current_user.id == @user.id
    erb :user_profile
  else
    status 404
  end
end

not_found do
  erb :page_not_found
end
