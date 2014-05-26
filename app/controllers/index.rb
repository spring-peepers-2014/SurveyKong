get '/' do
  if current_user
    redirect to "user/#{current_user.id}"
  else
    erb :index
  end
end
